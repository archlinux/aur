# Maintainer: Edoardo Morassutto <edoardo.morassutto@gmail.com>

pkgname=cli11
pkgver=1.5.3
pkgrel=1
pkgdesc='Command line parser for C++11'
arch=('any')
url='https://github.com/CLIUtils/CLI11'
license=('CUSTOM')
source=("https://github.com/CLIUtils/CLI11/archive/v${pkgver}.zip"
        "https://github.com/CLIUtils/CLI11/releases/download/v${pkgver}/CLI11.hpp"
        "https://raw.githubusercontent.com/CLIUtils/CLI11/v${pkgver}/LICENSE")
sha256sums=('98039c4ca81d701e15a2ccb528457f8d9d1dc0a6ebcbb816334d8da458eb3352'
            '464d6583af5521523c0a75ff46ade3c4aadac952d64f31747d303313a3b05d72'
            '8dc15a2096fcd14a09fa59b070f0a2824f5698d0786f8a416c08958eeef19f18')

package() {
    cd "${srcdir}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/cli11/LICENSE"
    install -Dm644 CLI11.hpp "${pkgdir}/usr/include/CLI11.hpp"
    cd "CLI11-${pkgver}"
    cp -R include "${pkgdir}/usr"
}
