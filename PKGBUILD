# Maintainer:  olliemath <oliver.margetts@gmail.com>
# Contributer:  jyantis <yantis@yantis.net>

pkgname=python-geopy
pkgver=1.11.0
pkgrel=1
pkgdesc='Geocoding Toolbox for Python 3. Includes geocoder classes for the OpenStreetMap,ESRI ArcGIS,Google,Baidu,Bing,Yahoo,Yandex,IGN France,GeoNames,NaviData,OpenMapQuest,What3Words,OpenCage,SmartyStreets,geocoder.us, and GeocodeFarm geocoder services.'
arch=('any')
url='https://github.com/geopy/geopy'
license=('custom')
depends=('python' 
         'python-requests-oauthlib'
         'python-pytz')
source=("https://pypi.python.org/packages/source/g/geopy/geopy-${pkgver}.tar.gz")
sha256sums=('4250e5a9e9f7abb990eddf01d1491fc112755e14f76060011c607ba759a74112')
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

# vim:set ts=2 sw=2 et:
