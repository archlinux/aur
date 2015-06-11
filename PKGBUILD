# Maintainer:  jyantis <yantis@yantis.net>

pkgname=python-geopy
pkgver=1.9.0
pkgrel=1
pkgdesc='Geocoding Toolbox for Python 3. Includes geocoder classes for the OpenStreetMap,ESRI ArcGIS,Google,Baidu,Bing,Yahoo,Yandex,IGN France,GeoNames,NaviData,OpenMapQuest,What3Words,OpenCage,SmartyStreets,geocoder.us, and GeocodeFarm geocoder services.'
arch=('any')
url='https://github.com/geopy/geopy'
license=('custom')
depends=('python' 
         'python-requests-oauthlib'
         'python-pytz')
source=("https://pypi.python.org/packages/source/g/geopy/geopy-${pkgver}.tar.gz")
md5sums=('ec2a0943cfcbac67a410d70b22fe3288')
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
