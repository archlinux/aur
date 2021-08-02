# Maintainer: slimymars <slimymars at gmail dot com>
# Contributor: LaFr4nc3 <lafr4nc3 at gmail dot com>
pkgname=ttf-hackgen
pkgver=2.4.1
pkgrel=1
pkgdesc="HackGen is a composite font of Hack and GenJyuu-Gothic."
arch=("any")
url="https://github.com/yuru7/HackGen"
license=("custom")
source=("https://github.com/yuru7/HackGen/releases/download/v${pkgver}/HackGen_v${pkgver}.zip"
        "https://github.com/yuru7/HackGen/releases/download/v${pkgver}/HackGenNerd_v${pkgver}.zip"
        "https://raw.githubusercontent.com/yuru7/HackGen/v${pkgver}/LICENSE.txt")
sha256sums=('dde9fd6fcbdcb206a6dceac717894c5dfbd00d59e5938ce3dd1b61c4c23d0afa'
            '90e7de7516ba044420362c59240f02986ebd85bf8b3aafcac98bce2a41e3b06e'
            '8ac2fc3472cd8c8c988bbd047a9739f528f614a3e61ff0925e26d2e76e53301d')

package() {
    install -d ${pkgdir}/usr/share/fonts/TTF
    install -m644 HackGen_v${pkgver}/*.ttf ${pkgdir}/usr/share/fonts/TTF/
    install -m644 HackGenNerd_v${pkgver}/*.ttf ${pkgdir}/usr/share/fonts/TTF/

    cd ${srcdir}

    install -D -m644 LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt
}
