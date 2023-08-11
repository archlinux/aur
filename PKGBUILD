# Maintainer: Jakub Klinkovský <j.l.k@gmx.com>

pkgname=python-hostlist
pkgdesc="Python module for handling LLNL hostlists"
pkgver=1.23.0
pkgrel=1
arch=(x86_64)
url="https://www.nsc.liu.se/~kent/python-hostlist/"
license=(GPL2)
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=("https://www.nsc.liu.se/~kent/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('9dbf4fa47920d451e352fde556570e60')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
