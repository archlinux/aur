# Maintainer: Chan Beom Park <cbpark@gmail.com>

pkgname=softsusy
pkgver=3.7.3
pkgrel=1
pkgdesc="This program provides a SUSY spectrum in the NMSSM, or the MSSM including flavour violation and with or without R-parity consistent with input Standard Model fermion mass/mixings and electroweak/strong coupling data."
arch=("i686" "x86_64")
url="http://softsusy.hepforge.org"
license=('GPL')
depends=("gcc-fortran")
source=("http://www.hepforge.org/archive/softsusy/$pkgname-$pkgver.tar.gz")
sha256sums=('eeb9d9ae37bb9f0ecbf23d57bf6bc35770885293f08342ffe837735b8491d457')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -D -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
