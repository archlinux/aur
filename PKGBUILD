# Maintainer: Andrey Zhidenkov <pensnarik@gmail.com>

pkgname=pg_export
pkgver=0.4
pkgrel=1
pkgdesc="Dumps PostgreSQL database structure on disk"
arch=(any)
depends=(postgresql)
source=("https://github.com/pensnarik/pg_export/archive/v${pkgver}.tar.gz")
md5sums=('4b1660cbfe52cb2a46d634ed25c78624')

build() {
  cd $pkgname-$pkgver
  python2 setup.py build
}

package() {
  cd $pkgname-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1
}
