# Maintainer: mark.blakeney at bullet-systems dot net
pkgname=gnucash-asx-fetch
pkgver=1.7
pkgrel=1
pkgdesc="Utility to fetch and add current ASX prices to one or more gnucash XML files"
url="https://github.com/bulletmark/$pkgname"
license=(GPL-3.0-or-later)
arch=(any)
depends=("python>=3.7" "python-yfinance")
makedepends=(python-setuptools python-build python-installer
             python-wheel python-setuptools-scm)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha1sums=('b1c39fad59847abd6f205b8f1b31f6acb832012a')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver" python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
