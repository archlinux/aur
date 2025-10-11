# Maintainer: Romain Labolle <aur@labolle.eu>
# Contributor: Lorenz Steinert <lorenz@steinerts.de>
pkgname=python-icalevents
_name=${pkgname#python-}
pkgver=0.3.1
pkgrel=1
pkgdesc="Python module for iCal URL/file parsing and querying."
arch=(any)
url="https://github.com/jazzband/icalevents"
license=('MIT')
depends=('python-icalendar' 'python-dateutil' 'python-pytz' 'python-urllib3')
makedepends=(python-build python-installer python-wheel python-poetry-core)
optdepends=()
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha256sums=('6263b914bf6836647ea4eec4a908cd59d2c1fe0a5b1cd1c533840056bf5d17cd')

build() {
  cd "$_name-$pkgver"

  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
