# Contributor: Rowisi < nomail <at> private <dot> com >
# Contributor: So1ar <so1ar114514@gmail.com>
# Manitor: Bot-wxt1221<3264117476@qq.com>

pkgname=hmcl-stable-bin
_ver=3.5.6
pkgver=${_ver}
pkgrel=2
pkgdesc="A Minecraft Launcher which is multi-functional, cross-platform and popular."
arch=('any')
url="https://github.com/huanghongxun/HMCL"
license=('GPL3')
depends=('java-runtime' 'gtk2')
provides=('hmcl')
conflicts=('hmcl')
source=("hmcl.desktop"
        "hmcl-launch-script"
        "craft_table.png"
        "LICENSE::https://raw.githubusercontent.com/HMCL-dev/HMCL/javafx/LICENSE"
        "${pkgname}-${pkgver}-${pkgrel}.jar::https://github.com/HMCL-dev/HMCL/releases/download/release-${pkgver}/HMCL-${pkgver}.jar")
sha256sums=('a367a2d222dc86b3e3a60af0727192aa461922735825bf2ccab72a1d95c60325'
            '1af922ba81426e0d96df33d12390b924c2fa76b42f276e2d5f4d925765cb3be2'
            '2989a1b5301b8c7b9afdae5696c6a4e5246afa2d4f1f3d3dad5c192f036a9b4c'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            '03c17c79f339c93034b4343c7ccc56a7d499df527466321402e60f8e1c606b9e')

noextract=("${pkgname}-${pkgver}-${pkgrel}.jar")

package() {
  install -Dm755 "hmcl-launch-script" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "hmcl.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${pkgname}-${pkgver}-${pkgrel}.jar" "${pkgdir}/usr/share/java/hmcl-stable-bin/hmcl-bin.jar"
  install -Dm644 "craft_table.png" "${pkgdir}/usr/share/icons/hicolor/48x48/apps/${pkgname}.png"
  install -Dm644 "LICENSE" "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
