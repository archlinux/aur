# Maintainer: James F. Carter <james@jfc.org.uk>
pkgname=subunit
pkgver=1.2.0
pkgrel=1
pkgdesc="A streaming protocol for test results"
arch=('x86_64' 'i686')
url="https://github.com/testing-cabal/subunit"
license=('Apache')
makedepends=('check' 'cppunit')
source=("https://github.com/testing-cabal/subunit/archive/$pkgver.tar.gz")
md5sums=('05cc1b275441d38511d8c986602ce31b')

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
