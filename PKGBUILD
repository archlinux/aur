# Maintainer: John "ShaggyTwoDope" Jenkins <twodopeshaggy at gmail dot com>
pkgname=nq
pkgver=0.1
pkgrel=1
pkgdesc="Unix command line queue utility"
arch=('i686' 'x86_64')
url="https://github.com/chneukirchen/nq"
license=('GPL')
makedepends=('make')
source=(https://github.com/chneukirchen/nq/archive/v$pkgver.tar.gz)
md5sums=('377709040c90354e4e74aefc62f8172c')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX="/usr" all
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" PREFIX="/usr" install
}
