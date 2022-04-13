# Contributor: Rowisi < nomail <at> private <dot> com >
# Maintainer: So1ar <so1ar114514@gmail.com>

pkgname=hmcl-new
_ver=3.5.2
_build=218
pkgver=${_ver}.${_build}
pkgrel=2
pkgdesc="An unofficial build of HMCL that trying to compile and run with the latest version of java. "
arch=('any')
url="https://github.com/so1ar/HMCL-build"
license=('GPL3')
depends=('java-openjfx')
provides=('hmcl')
conflicts=('hmcl')
source=("hmcl.desktop"
        "hmcl-launch-script"
        "craft_table.png"
        "LICENSE::https://raw.githubusercontent.com/huanghongxun/HMCL/javafx/LICENSE"
        "${pkgname}-${pkgver}-${pkgrel}.jar::https://github.com/so1ar/HMCL-build/releases/download/${pkgver}/HMCL-${pkgver}.jar")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            '576f740216d29f6a1052e281a65290b932b770d90cdf33dad6ba32a384d9dc13')

noextract=("${pkgname}-${pkgver}-${pkgrel}.jar")

package() {
  install -Dm755 "hmcl-launch-script" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "hmcl.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${pkgname}-${pkgver}-${pkgrel}.jar" "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"
  install -Dm644 "craft_table.png" "${pkgdir}/usr/share/icons/hicolor/48x48/apps/${pkgname}.png"
  install -Dm644 "LICENSE" "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
