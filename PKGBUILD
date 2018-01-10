# Maintainer: James F. Carter <james@jfc.org.uk>
pkgname=subunit
pkgver=1.1.0
pkgrel=2
pkgdesc="A streaming protocol for test results"
arch=('x86_64' 'i686')
url="https://github.com/testing-cabal/subunit"
license=('Apache')
makedepends=('check' 'cppunit')
source=("https://github.com/testing-cabal/subunit/archive/$pkgver.tar.gz")
md5sums=('c1d0cf2363a0fcae3714de7ae83923e7')

build() {
  cd "$pkgname-$pkgver"

  autoreconf -vi
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
