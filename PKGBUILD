# Contributor: Rowisi < nomail <at> private <dot> com >
# Maintainer: So1ar <so1ar114514@gmail.com>

pkgname=hmcl-bin
_ver=3.5.4
_build=235
pkgver=${_ver}.${_build}
pkgrel=2
pkgdesc="A Minecraft Launcher which is multi-functional, cross-platform and popular."
arch=('any')
url="https://github.com/huanghongxun/HMCL"
license=('GPL3')
depends=('java-openjfx' 'java-runtime' 'gtk2')
provides=('hmcl')
conflicts=('hmcl')
source=("hmcl.desktop"
        "hmcl-launch-script"
        "craft_table.png"
        "LICENSE::https://raw.githubusercontent.com/huanghongxun/HMCL/javafx/LICENSE"
        "${pkgname}-${pkgver}-${pkgrel}.jar::https://github.com/huanghongxun/HMCL/releases/download/v${pkgver}/HMCL-${pkgver}.jar")
sha256sums=('9a561081f8f3ece3da114afd4f6d90565ca0e04716eef4ea88c6b4306566ae9b'
            '0c1ee34a9aa72e9f573730bff336e26095cb5e09d27d26d20ce3e0a7c5714ee7'
            '2989a1b5301b8c7b9afdae5696c6a4e5246afa2d4f1f3d3dad5c192f036a9b4c'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            '86946bbb52194786f37b3ea25a50baaa8edefed0ab78cdef22b213ded16a1702')

noextract=("${pkgname}-${pkgver}-${pkgrel}.jar")

package() {
  install -Dm755 "hmcl-launch-script" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "hmcl.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${pkgname}-${pkgver}-${pkgrel}.jar" "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"
  install -Dm644 "craft_table.png" "${pkgdir}/usr/share/icons/hicolor/48x48/apps/${pkgname}.png"
  install -Dm644 "LICENSE" "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
