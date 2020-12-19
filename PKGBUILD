# Maintainer: Lorenz Steinert <lorenz@steinerts.de>
_name=icalevents
pkgname=python-icalevents
pkgver=0.1.25
pkgrel=0
pkgdesc="Python module for iCal URL/file parsing and querying."
arch=(any)
url="https://github.com/irgangla/icalevents"
license=('MIT')
depends=('python-httplib2' 'python-icalendar' 'python-pytz')
makedepends=()
optdepends=()
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha256sums=('41615ffd7424ac1906d2c3de1fe72d8abba3d736416813b33ef063b4404d3517')

build() {
  cd "$_name-$pkgver"

  python setup.py build
}

package() {
  cd "$_name-$pkgver"

  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
