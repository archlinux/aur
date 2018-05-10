# Maintainer: Florian B. <gn0mish@protonmail.com>

pkgbase=python-geocoder
_gitname='geocoder-master'
pkgname=('python-geocoder')
pkgver=1.38.1
pkgrel=4
pkgdesc='A pure Python Geocoding module made easy. Supports ArcGIS, Bing,CanadaPost,FreeGeoIP Geocoder.ca, Geonames, Google, HERE, MapQuest, MaxMind, OpenCage, OpenStreetMap, GeoOttawa, TomTom, Yahoo )'
arch=('any')
url='https://github.com/DenisCarriere/geocoder'
license=('custom')
source=("https://github.com/DenisCarriere/geocoder/archive/master.zip")
md5sums=('633a52784503a40a2b3f810da358a2e5')
makedepends=('python' 'python-setuptools')

build() {
  cd ${_gitname}
  python setup.py build
}

package_python-geocoder() {
  depends=('flake8' 'python-nose' 'python-tox' 'python-requests')
  provides=('python-geocoder-git')
  conflicts=('python-geocoder-git')
  cd ${_gitname}
  python setup.py install --root="${pkgdir}" --optimize=1
  mv "${pkgdir}"/usr/bin/geocode{,-py3}
}
