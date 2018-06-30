# Maintainer: XavierCLL <xavier.corredor.llano (a) gmail.com>
# Contributer:  olliemath <oliver.margetts@gmail.com>
# Contributer:  jyantis <yantis@yantis.net>

pkgname=python-geopy
pkgver=1.14.0
pkgrel=1
pkgdesc='Geocoding Toolbox for Python 3. Includes geocoder classes for the OpenStreetMap,ESRI ArcGIS,Google,Baidu,Bing,Yahoo,Yandex,IGN France,GeoNames,NaviData,OpenMapQuest,What3Words,OpenCage,SmartyStreets,geocoder.us, and GeocodeFarm geocoder services.'
arch=('any')
url='https://github.com/geopy/geopy'
license=('custom')
depends=('python' 
         'python-requests-oauthlib'
         'python-pytz')
source=("https://pypi.python.org/packages/source/g/geopy/geopy-${pkgver}.tar.gz")
sha256sums=('9df0d61b431c51bcc47e64d16f9517dacfed10875f0dfc36cd8cb87c52fa9547')
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
