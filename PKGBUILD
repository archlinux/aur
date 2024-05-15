# Contributor: Rowisi < nomail <at> private <dot> com >
# Contributor: So1ar <so1ar114514@gmail.com>
# Contributor: Bot-wxt1221 <3264117476@qq.com>
# Maintainer: TTsdzb <ttsdzb at outlook dot com>

pkgname=hmcl-bin
_ver=3.5.7.247
pkgver=${_ver}
pkgrel=1
pkgdesc="A Minecraft Launcher which is multi-functional, cross-platform and popular."
arch=('any')
url="https://github.com/huanghongxun/HMCL"
license=('GPL3')
depends=('java-runtime' 'gtk2' 'java-openjfx')
provides=('hmcl')
conflicts=('hmcl')
source=("hmcl.desktop"
        "hmcl-launch-script"
        "craft_table.png"
        "LICENSE::https://raw.githubusercontent.com/HMCL-dev/HMCL/javafx/LICENSE"
        "${pkgname}-${pkgver}-${pkgrel}.jar::https://github.com/HMCL-dev/HMCL/releases/download/v${pkgver}/HMCL-${pkgver}.jar")
sha256sums=('9a561081f8f3ece3da114afd4f6d90565ca0e04716eef4ea88c6b4306566ae9b'
            'ebbb213b2e21321af6b1825740b2b8f66e70a922a4427e90fa21a2c998b39b34'
            '2989a1b5301b8c7b9afdae5696c6a4e5246afa2d4f1f3d3dad5c192f036a9b4c'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            'd883daa7cc59c9502b9db6a63e6be6552afd3fa9527d69590e9e1b97d3e9e443')

noextract=("${pkgname}-${pkgver}-${pkgrel}.jar")

package() {
  install -Dm755 "hmcl-launch-script" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "hmcl.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${pkgname}-${pkgver}-${pkgrel}.jar" "${pkgdir}/usr/share/java/hmcl-bin/hmcl-bin.jar"
  install -Dm644 "craft_table.png" "${pkgdir}/usr/share/icons/hicolor/48x48/apps/${pkgname}.png"
  install -Dm644 "LICENSE" "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
