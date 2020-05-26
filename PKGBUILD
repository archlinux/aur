# Maintainer: Alexander Courtis <alex@courtis.org>
pkgname=interception-dual-function-keys
pkgver=1.0.0
pkgrel=1
pkgdesc="Dual function keys: tap for one key, hold for another."
arch=('x86_64')
url="https://gitlab.com/interception/linux/plugins/dual-function-keys/"
license=('MIT')
depends=('interception-tools')
source=("$pkgname-$pkgver.tar.gz::https://gitlab.com/interception/linux/plugins/dual-function-keys/repository/archive.tar.gz?ref=${pkgver}")
md5sums=('d47da2941f18e5b0d3d4e4492ae08648')

build() {
  cd $srcdir/dual-function-keys-$pkgver-*

  make
}

package() {
  cd $srcdir/dual-function-keys-$pkgver-*

  make PREFIX=/usr DESTDIR="$pkgdir" install
}
