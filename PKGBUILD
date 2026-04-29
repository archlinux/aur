pkgname=moon-child-fe-bin
pkgver=1.0.5
pkgrel=1
pkgdesc="Moon Child FE (Friend Edition) is a modern source port of the 1997 Windows 95 classic, Moon Child. It's designed to be the definitive way to experience the game on modern hardware."
arch=('x86_64')
url='https://github.com/MorsGames/MoonChildFE'
license=('MIT')
source=(
    "${pkgname}.desktop"
    "${pkgname}.png"
    "${pkgname}-${pkgver}.zip::https://github.com/MorsGames/MoonChildFE/releases/download/v1.0.5/MoonChildFE-LinuxX64.tar.gz")
sha256sums=(c73e087b89ecbb1bb66848cf1bb2f9198fd67930f5042eebf8871deec8d93fa3
    c93852e775304a9a31dcb62d0150edef6cc83c44f66d7bd9300ca1592444d4d6
    a1938fee8a2ab420d73fee85a393c21a752ae2ce5caa1c497039a89d1432f8d3)

package(){
    install -Dm777 "${srcdir}/MoonChildFE" "$pkgdir/usr/share/${pkgname}/MoonChildFE"
    install -Dm777 "${srcdir}/gamecontrollerdb.txt" "$pkgdir/usr/share/${pkgname}/gamecontrollerdb.txt"
    cp -rf "${srcdir}/data" "$pkgdir/usr/share/${pkgname}/data"

    install -Dm777 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm755 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}