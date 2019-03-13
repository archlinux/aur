# Maintainer: lomonosow <lomonosow93@gmail.com>
pkgname=vt_lock
pkgver=0.1
pkgrel=1
pkgdesc="Simple virtual terminal locker"
arch=('any')
url="https://github.com/Lomonosow/vt_lock"
license=('MIT')
makedepends=('make' 'gcc')
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('6161ca13583263edc6f7c4a30005b57f1c9f543149f67b65ca4e1cdb7a9a6b3457c63676668b09d3828976ba77ff84f03d3d2f0b119d0001e2939852e3873d32')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
