# Maintainer: Pierre Carrier <pierre@gcarrier.fr>

pkgname=afuse
pkgver=0.4.1
pkgrel=1
pkgdesc='Automounting file system implemented in user-space using FUSE'
url=https://github.com/pcarrier/afuse/
license=(GPL2)
arch=(i686 x86_64)
depends=(fuse)
source=(https://$pkgname.googlecode.com/files/$pkgname-$pkgver.tar.gz)
md5sums=(317efdda85d5585d085c61a0d262b83b)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
