# Maintainer: mark.blakeney at bullet-systems dot net
pkgname=gnucash-asx-fetch
pkgver=1.6
pkgrel=1
pkgdesc="Utility to fetch and add current ASX prices to one or more gnucash XML files"
url="https://github.com/bulletmark/$pkgname"
license=(GPL3)
arch=(any)
depends=("python>=3.6" "python-yfinance")
makedepends=(python-setuptools python-build python-installer
             python-wheel python-setuptools-scm)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha1sums=('3f06f570a91267c7eb8413780197fb01b13050fb')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver" python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
