pkgname=moon-child-fe-bin
pkgver=1.1.1
pkgrel=1
pkgdesc="Moon Child FE (Friend Edition) is a modern source port of the 1997 Windows 95 classic, Moon Child. It's designed to be the definitive way to experience the game on modern hardware."
arch=('x86_64')
url='https://github.com/MorsGames/MoonChildFE'
license=('MIT')
source=(
    "${pkgname}.desktop"
    "${pkgname}.png"
    "${pkgname}-${pkgver}.zip::https://github.com/MorsGames/MoonChildFE/releases/download/v1.1.1/MoonChildFE-LinuxX64.tar.gz")
sha256sums=(cf5e562537616f3d97cdf480d28eaef4ada03b3544f60d6b9f4e5ef01c127c6a
    c93852e775304a9a31dcb62d0150edef6cc83c44f66d7bd9300ca1592444d4d6
    36fe3c65e94ae85ef4667b4e3c616c8a4f464daea99bc7555f79007b63e33e63)

package(){
    install -Dm777 "${srcdir}/Moon Child FE" "$pkgdir/usr/share/${pkgname}/MoonChildFE"
    cp -rf "${srcdir}/data" "$pkgdir/usr/share/${pkgname}/data"

    install -Dm777 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm755 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}