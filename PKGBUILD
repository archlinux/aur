# Maintainer: mark.blakeney at bullet-systems dot net
pkgname=gnucash-asx-fetch
pkgver=1.5
pkgrel=1
pkgdesc="Utility to fetch and add current ASX prices to one or more gnucash XML files"
url="https://github.com/bulletmark/$pkgname"
license=(GPL3)
arch=(any)
depends=("python>=3.6")
makedepends=(python-setuptools python-build python-installer python-wheel)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha1sums=('8db2ae38705ffc6935382006eb3c383493bd5492')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
