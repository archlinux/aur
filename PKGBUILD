# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
pkgname=python-easydev
_name=${pkgname#python-}
pkgver=0.13.0
pkgrel=1
pkgdesc="Provides utilities that are of general usage for the development of Python packages"
arch=(any)
license=(GPL)
depends=(python-sphinx)
makedepends=(python-build python-installer python-wheel python-poetry-core)
url="https://github.com/cokelaer/easydev"
source=($_name-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
sha256sums=('e5c4d34256b6c750fb04f3b14d6c9a725acae37b1b4eecb388ee30ab78097212')

build() {
  cd "$srcdir/$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
