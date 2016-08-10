# Maintainer: buckket <buckket@cock.li>

pkgname=liberation-circuit
pkgver=alpha2_1
pkgrel=1
pkgdesc="A real-time strategy/programming game"
arch=("x86_64" "i686")
license=("GPL3")
url="https://sourceforge.net/projects/liberation-circuit/"
depends=("allegro")
makedepends=("redo")
source=("http://downloads.sourceforge.net/project/${pkgname}/alpha_2/LibCirc_${pkgver}_src.zip" "libcirc")
sha256sums=('4a034d9fb079a21bc93b07b480beef293a13abcc7e4e22592f1ee467f025e7de'
            '2560ef7dd15ec609177b2330e075d6414421b4a4ed857873675cd748b511d54a')

build() {
  cd LibCirc_src
  redo
}

package() {
  cd LibCirc_src
  install -Dm755 ../libcirc "${pkgdir}/usr/bin/libcirc"
  install -Dm755 src/g_game bin/libcirc
  install -dm755 "${pkgdir}/usr/share/games/${pkgname}"
  cp -rf bin/* "${pkgdir}/usr/share/games/${pkgname}"
}

