# Maintainer: Lorenz Steinert <lorenz@steinerts.de>
_name=icalevents
pkgname=python-icalevents
pkgver=0.1.24
pkgrel=0
pkgdesc="Python module for iCal URL/file parsing and querying."
arch=(any)
url="https://github.com/irgangla/icalevents"
license=('MIT')
depends=('python-httplib2' 'python-icalendar' 'python-pytz')
makedepends=()
optdepends=()
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha256sums=('242d79860eae55eeeb4906ecac6b486f35f22e36ab8f60c8142e911c16f2d27b')

build() {
  cd "$_name-$pkgver"

  python setup.py build
}

package() {
  cd "$_name-$pkgver"

  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
