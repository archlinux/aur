# Maintainer: LaFr4nc3 <lafr4nc3 at gmail dot com>
pkgname=ttf-hackgen
pkgver=2.1.0
pkgrel=1
pkgdesc="HackGen is a composite font of Hack and GenJyuu-Gothic."
arch=("any")
url="https://github.com/yuru7/HackGen"
license=("custom")
source=("https://github.com/yuru7/HackGen/releases/download/v${pkgver}/HackGen_v${pkgver}.zip"
        "https://github.com/yuru7/HackGen/releases/download/v${pkgver}/HackGenNerd_v${pkgver}.zip"
        "https://raw.githubusercontent.com/yuru7/HackGen/v${pkgver}/LICENSE.txt")
sha256sums=("a1ccb44e72abb7bf0bc3dd6bc208cc9514d5b22e3096010cf82ebccecc1d0384"
            "678e1597448ccf75ba29a1f47600f5aded00ab13220ca3db99ad3b1266e5dfa4"
            "8ac2fc3472cd8c8c988bbd047a9739f528f614a3e61ff0925e26d2e76e53301d")

package() {
    install -d ${pkgdir}/usr/share/fonts/TTF
    install -m644 HackGen_v${pkgver}/*.ttf ${pkgdir}/usr/share/fonts/TTF/
    install -m644 HackGenNerd_v${pkgver}/*.ttf ${pkgdir}/usr/share/fonts/TTF/

    cd ${srcdir}

    install -D -m644 LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt
}
