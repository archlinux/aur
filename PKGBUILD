# Maintainer: David Herrmann <dh.herrmann@gmail.com>

pkgname=c-rbtree
pkgver=1
pkgrel=1
pkgdesc='Red-Black Tree Implementation'
arch=('i686' 'x86_64')
url='https://github.com/c-util/c-rbtree'
license=('LGPL2.1')
depends=('glibc')
source=(https://github.com/c-util/$pkgname/archive/v$pkgver.tar.gz)
md5sums=('8d3b6313dea65e9b00c17d178662bd53')

build() {
  cd $pkgname-$pkgver
  ./autogen.sh c
  make
}

check() {
  make -C $pkgname-$pkgver check
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
