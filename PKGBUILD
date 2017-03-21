# Maintainer: buckket <buckket@cock.li>

pkgname=liberation-circuit
pkgver=1.1
pkgrel=1
pkgdesc="A real-time strategy/programming game"
arch=("x86_64" "i686")
license=("GPL3")
url="https://github.com/linleyh/liberation-circuit"
depends=("allegro")
makedepends=("redo")
source=("https://github.com/linleyh/liberation-circuit/archive/v1.1.tar.gz"
        "libcirc")
sha256sums=('a3f3987b40f2c88de29425a2af59c5667edd5f6f0423f1bff541860c9a915047'
            '2560ef7dd15ec609177b2330e075d6414421b4a4ed857873675cd748b511d54a')

build() {
  cd liberation-circuit-1.1
  redo
}

package() {
  cd liberation-circuit-1.1
  install -Dm755 ../libcirc "${pkgdir}/usr/bin/libcirc"
  install -dm755 "${pkgdir}/usr/share/games/${pkgname}"
  install -Dm755 src/g_game "${pkgdir}/usr/share/games/${pkgname}/libcirc"
  rm bin/libcirc
  rm bin/libcirc.do
  cp -rf bin/* "${pkgdir}/usr/share/games/${pkgname}"
}

