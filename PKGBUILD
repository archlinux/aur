# Maintainer: mark.blakeney at bullet-systems dot net
pkgname=cdhist
pkgver=3.4
pkgrel=1
pkgdesc="Linux shell cd history"
url="https://github.com/bulletmark/$pkgname"
license=(GPL3)
arch=(any)
depends=("python>=3.7")
makedepends=(python-setuptools python-build python-installer python-wheel)
install=install.sh
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha1sums=('13a2f68ffd83df32452d24b1fdf462f9b697837f')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
