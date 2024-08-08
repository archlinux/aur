# Maintainer: mark.blakeney at bullet-systems dot net
pkgname=cdhist
pkgver=3.9
pkgrel=1
pkgdesc="Linux shell cd history"
url="https://github.com/bulletmark/$pkgname"
license=(GPL-3.0-or-later)
arch=(any)
depends=("python>=3.7")
makedepends=(python-setuptools python-build python-installer
             python-wheel python-setuptools-scm)
install="install.sh"
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha1sums=('5d65a9cc65f8b7cc1f66aa1a2c0a1f224094c554')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver" python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
