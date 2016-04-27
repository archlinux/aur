# Maintainer: Chan Beom Park <cbpark@gmail.com>

pkgname=softsusy
pkgver=3.7.1
pkgrel=1
pkgdesc="package to provide a SUSY spectrum."
arch=("i686" "x86_64")
url="http://softsusy.hepforge.org"
license=('GPL')
depends=("gcc-fortran")
source=("http://www.hepforge.org/archive/softsusy/$pkgname-$pkgver.tar.gz")
sha256sums=('6811c4e167c0f832477e20755ecbddb30711d1d1a53267646715221e1d3de585')

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
