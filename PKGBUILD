# Maintainer: buckket <buckket@cock.li>

pkgname=liberation-circuit
pkgver=1.3
pkgrel=1
pkgdesc="A real-time strategy/programming game"
arch=("x86_64" "i686")
license=("GPL3")
url="https://github.com/linleyh/liberation-circuit"
depends=("allegro")
makedepends=("redo")
install=${pkgname}.install
source=("https://github.com/linleyh/liberation-circuit/archive/v${pkgver}.tar.gz"
        "libcirc")
sha256sums=('3c18c5815aa139e2bf3048e42bbb4bf7f1b3d05022ea0a3c764bc25f420f2b4f'
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

