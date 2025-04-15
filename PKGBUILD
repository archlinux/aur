# Maintainer: Romain Labolle <aur@labolle.eu>
# Contributor: Lorenz Steinert <lorenz@steinerts.de>
pkgname=python-icalevents
_name=${pkgname#python-}
pkgver=0.2.1
pkgrel=1
pkgdesc="Python module for iCal URL/file parsing and querying."
arch=(any)
url="https://github.com/irgangla/icalevents"
license=('MIT')
depends=('python-httplib2' 'python-icalendar' 'python-pytz')
makedepends=(python-build python-installer python-wheel python-poetry-core)
optdepends=()
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha256sums=('b7f2827b581269d4315b345b54cf7d661b4453a7b190f7dbef99e5ba8f5669e1')

build() {
  cd "$_name-$pkgver"

  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
