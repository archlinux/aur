# Maintainer: mark.blakeney at bullet-systems dot net
pkgname=cdhist
pkgver=3.8
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
sha1sums=('62dbb627ac58089950560a964be298157d39b446')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver" python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
