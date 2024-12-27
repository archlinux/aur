# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
pkgname=python-easydev
_name=${pkgname#python-}
pkgver=0.13.2
pkgrel=2
pkgdesc="Provides utilities that are of general usage for the development of Python packages"
arch=(any)
license=(BSD)
depends=(python)
makedepends=(python-build python-installer python-wheel python-poetry-core)
url="https://github.com/cokelaer/easydev"
source=($_name-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
#source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha256sums=('fcf2a26adfdc1e108ef65f6b5cbf917740feb4726ef3332ce2ec2cf29b722d6a')

build() {
  cd "$srcdir/$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
