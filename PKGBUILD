# Maintainer: Adrien Wu <adrien.sf.wu@gmail.com>
pkgname=linger-switch
pkgver=1.0
pkgrel=3
pkgdesc="A tool to let user to enable / disable lingering"
url="https://github.com/adrien1018/linger-switch"
arch=('i686' 'x86_64')
provides=('linger-switch')
source=('Makefile' 'linger-switch.cpp')
sha256sums=(
  '2d4a6f71050d8e45f8f82e17e449078f892299c47bd27c5f6a0d612975b5b31e'
  '18e002192d2b1c130f37779ed2b0b0846cd001014c4eb658fbbdb43f15bd84f3'
)

build() {
  cd "$srcdir"
  make
}

package() {
  install -d -m0711 "${pkgdir}/var/lib/systemd/linger"
  install -D -m4755 "$srcdir/linger-switch" "${pkgdir}/usr/bin/linger-switch"
}
