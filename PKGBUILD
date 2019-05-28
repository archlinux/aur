# Maintainer: XavierCLL <xavier.corredor.llano (a) gmail.com>
# Contributer:  olliemath <oliver.margetts@gmail.com>
# Contributer:  jyantis <yantis@yantis.net>

pkgname=python-geopy
pkgver=1.20.0
pkgrel=1
pkgdesc='Geocoding Toolbox for Python 3. Includes geocoder classes for the OpenStreetMap Nominatim, Google Geocoding API (V3), and many other geocoding services'
arch=('any')
url='https://github.com/geopy/geopy'
license=('custom')
depends=('python' 
         'python-requests-oauthlib'
         'python-pytz'
         'python-geographiclib')
source=("https://pypi.python.org/packages/source/g/geopy/geopy-${pkgver}.tar.gz")
sha256sums=('9419bc90ee6231590c4ae7acf1cf126cefbd0736942da7a6a1436946e80830e2')
makedepends=('python-setuptools')
provides=('python-geopy-git')
conflicts=('python-geopy-git')

build() {
  cd geopy-${pkgver}
  python setup.py build
}

package() {
  cd geopy-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize=1
}
