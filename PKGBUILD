# Maintainer: Rowisi < nomail <at> private <dot> com >

pkgname=hmcl-bin
pkgver=3.3.162
pkgrel=2
pkgdesc="A Minecraft Launcher which is multi-functional, cross-platform and popular."
arch=('any')
url="https://github.com/huanghongxun/HMCL"
license=('GPL3')
depends=('java8-openjfx')
provides=('hmcl')
conflicts=('hmcl')
source=("hmcl.desktop"
        "hmcl-launch-script"
        "craft_table.png"
        "${pkgname}-${pkgver}-${pkgrel}.jar::${url}/releases/download/v${pkgver}/HMCL-${pkgver}.jar")
sha256sums=('875ae9220fbe452ab4e35ad912ca94133b223e9f133163762f57d9ca4f300863'
            'cef85329b2b3131a0020efdf29037535ad138c201a6593b2029127ce60a4184c'
            '2989a1b5301b8c7b9afdae5696c6a4e5246afa2d4f1f3d3dad5c192f036a9b4c'
            '74edd9871569f7fe0cb03902b401a7b693e8e77e9b48c61459a1dcaa66eebde8')

package() {
  install -Dm755 "hmcl-launch-script" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "hmcl.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${pkgname}-${pkgver}-${pkgrel}.jar" "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"
  install -Dm644 "craft_table.png" "${pkgdir}/usr/share/icons/hicolor/48x48/apps/${pkgname}.png"
}
