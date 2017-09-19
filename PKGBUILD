# Maintainer: Jochen Saalfeld <jochen@intevation.de>
pkgname='shallot'
pkgver=0.0.7
pkgrel=1
pkgdesc="Hashing for specific vanity onion adresses"
arch=('x86_64')
url="https://github.com/jsaalfeld/Shallot"
license=('NONE')
provides=('shallot')
conflicts=()
makedepends=('make' 'openssl' )
source=("https://github.com/jsaalfeld/Shallot/archive/$pkgname-$pkgver.tar.gz" )
md5sums=('88cef0951c0e23be969240a895ee54a5')
sha256sums=('c37cc0d3b8c21b0e3df0b7cf7c4661bc26d79b1c3775fa4d455fe718fdaad7f5')

build() {
  cd "Shallot-$pkgname-$pkgver"
  ./configure
  make
}

package() {
  cd "Shallot-$pkgname-$pkgver"
  mkdir $pkgdir/usr
  mkdir $pkgdir/usr/bin
  make DESTDIR="$pkgdir" install
}

