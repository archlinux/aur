# Maintainer: slimymars <slimymars at gmail dot com>
# Contributor: LaFr4nc3 <lafr4nc3 at gmail dot com>
pkgname=ttf-hackgen
pkgver=2.6.1
pkgrel=1
pkgdesc="Composite font of Hack and GenJyuu-Gothic. This package includes HackGen-Nerd."
arch=("any")
url="https://github.com/yuru7/HackGen"
license=("custom")
source=("https://github.com/yuru7/HackGen/releases/download/v${pkgver}/HackGen_v${pkgver}.zip"
        "https://github.com/yuru7/HackGen/releases/download/v${pkgver}/HackGenNerd_v${pkgver}.zip"
        "https://raw.githubusercontent.com/yuru7/HackGen/v${pkgver}/LICENSE.txt")
sha256sums=('e0e64d521beb43df633f86201ee8f9d1614876e9633a0991772fda9f93da815b'
            '94543ef3be2bac02e313029d3c86fd8f3a79d17ff5d704084739230086e39625'
            '8ac2fc3472cd8c8c988bbd047a9739f528f614a3e61ff0925e26d2e76e53301d')

package() {
    install -d ${pkgdir}/usr/share/fonts/TTF
    install -m644 HackGen_v${pkgver}/*.ttf ${pkgdir}/usr/share/fonts/TTF/
    install -m644 HackGenNerd_v${pkgver}/*.ttf ${pkgdir}/usr/share/fonts/TTF/

    cd ${srcdir}

    install -D -m644 LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt
}
