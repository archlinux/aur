# Maintainer: John "ShaggyTwoDope" Jenkins <twodopeshaggy at gmail dot com>
pkgname=nq
pkgver=0.2.1
pkgrel=1
pkgdesc="Unix command line queue utility"
arch=('i686' 'x86_64')
url="https://github.com/chneukirchen/nq"
license=('GPL')
makedepends=('make')
conflicts=("nq-git")
provides=("nq")
source=(https://github.com/chneukirchen/nq/archive/v$pkgver.tar.gz)
md5sums=('ba765d965ade6bf5059496b2bb2e59f1')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX="/usr" all
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" PREFIX="/usr" install
}
