# Maintainer: GI Jack <GI_Jack@hackermail.com>
# Contributor: Thomas Gatzweiler <thomas.gatzweiler@gmail.com>

pkgname=flmsg
pkgver=4.0.16
pkgrel=1
pkgdesc="Forms management editor for Amateur Radio standard message formats"
arch=('i686' 'x86_64')
url="http://www.w1hkj.com/"
groups=('w1hkj')
license=('GPL')
depends=('fldigi')
source=(http://www.w1hkj.com/files/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('db9d30a98d0b9620020afa45307f5bc4f929c17de42c9f98416e34cdc1b946ec')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

check() {
  cd "$srcdir"/$pkgname-$pkgver
  make -k check
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
