# Maintainer: Alexander Courtis <alex@courtis.org>
pkgname=interception-dual-function-keys
pkgver=1.2.0
pkgrel=1
pkgdesc="Dual function keys: tap for one key, hold for another."
arch=('x86_64')
url="https://gitlab.com/interception/linux/plugins/dual-function-keys/"
license=('MIT')
depends=('interception-tools')
source=("$pkgname-$pkgver.tar.gz::https://gitlab.com/interception/linux/plugins/dual-function-keys/repository/archive.tar.gz?ref=${pkgver}")
md5sums=('5c929cccb400f1618566f5f917308a7b')

build() {
  cd $srcdir/dual-function-keys-$pkgver-*

  make VERSION=$pkgver
}

package() {
  cd $srcdir/dual-function-keys-$pkgver-*

  make PREFIX=/usr DESTDIR="$pkgdir" install
}
