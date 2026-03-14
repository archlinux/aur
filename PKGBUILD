# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
pkgname=python-easydev
_name=${pkgname#python-}
pkgver=0.14.0
pkgrel=1
pkgdesc="Provides utilities that are of general usage for the development of Python packages"
arch=(any)
license=(BSD-3-Clause)
depends=(python)
makedepends=(python-build python-installer python-wheel python-poetry-core)
url="https://github.com/cokelaer/easydev"
source=($_name-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
sha256sums=('c605f7a6290139705c1218e5ca126c7fffde6907f2b4acb25043ee54a39a0aa9')

build() {
  cd "$srcdir/$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
