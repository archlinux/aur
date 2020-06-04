# Maintainer sgerwk <sgerwk at aol dot com>
pkgname=felinks
pkgver=0.13.2
pkgrel=1
pkgdesc="text browser"
license=(GPL2)
arch=('x86_64' 'i686')
depends=()
makedepends=('gcc' 'make')
url="http://github.com/rkd77/felinks"
source=(git+https://github.com/rkd77/felinks#tag=v$pkgver)
sha256sums=('SKIP')

build() {
  cd $startdir/src/$pkgname
  ./autogen.sh
  ./configure
  make || return 1
}

check() {
  cd $startdir/src/$pkgname
  return $(test -x src/elinks)
}

package() {
  cd $startdir/src/$pkgname
  make DESTDIR=$startdir/pkg/$pkgname install
}
