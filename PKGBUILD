# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
pkgname=python-easydev
_name=${pkgname#python-}
pkgver=0.13.3
pkgrel=1
pkgdesc="Provides utilities that are of general usage for the development of Python packages"
arch=(any)
license=(BSD-3-Clause)
depends=(python)
makedepends=(python-build python-installer python-wheel python-poetry-core)
url="https://github.com/cokelaer/easydev"
source=($_name-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
sha256sums=('347f814bde55f444cd4f1e6550189957f5933b257c4d7ade21198db370e417de')

build() {
  cd "$srcdir/$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
