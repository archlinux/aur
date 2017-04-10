# Maintainer: buckket <buckket@cock.li>

pkgname=liberation-circuit
pkgver=1.2
pkgrel=2
pkgdesc="A real-time strategy/programming game"
arch=("x86_64" "i686")
license=("GPL3")
url="https://github.com/linleyh/liberation-circuit"
depends=("allegro")
makedepends=("redo")
install=${pkgname}.install
source=("https://github.com/linleyh/liberation-circuit/archive/v${pkgver}.tar.gz"
        "libcirc")
sha256sums=('62fc67d6b56db8c583f0a6033a6a13632befc6b2dc48e17b9771f8181a3609e8'
            '2560ef7dd15ec609177b2330e075d6414421b4a4ed857873675cd748b511d54a')

build() {
  cd liberation-circuit-${pkgver}
  redo
}

package() {
  cd liberation-circuit-${pkgver}
  install -Dm755 ../libcirc "${pkgdir}/usr/bin/libcirc"
  install -dm755 "${pkgdir}/usr/share/games/${pkgname}"
  install -Dm755 src/g_game "${pkgdir}/usr/share/games/${pkgname}/libcirc"
  rm bin/libcirc
  rm bin/libcirc.do
  cp -rf bin/* "${pkgdir}/usr/share/games/${pkgname}"
}

