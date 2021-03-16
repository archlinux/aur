# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=mapillary_tools-git
_pkgname=mapillary_tools
pkgver=r1316.496deac
pkgrel=1
pkgdesc="Library for processing and uploading geotagged images to Mapillary"
url="https://github.com/mapillary/mapillary_tools"
depends=('python-exifread' 'python-gpxpy' 'python-pillow' 'python-piexif' 'python-pytz' 'python-yaml' 'python-tqdm' 'python-pynmea2' 'python-dateutil' 'python-requests' 'python-pymp4' 'python-construct')
license=('BSD')
arch=('any')
source=("${pkgname}"::'git+https://github.com/mapillary/mapillary_tools.git')
md5sums=('SKIP')

build() {
  cd $srcdir/${pkgname}
  python setup.py build
}

pkgver() {
  cd "$srcdir/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd $srcdir/${pkgname}
  python setup.py install --root="$pkgdir" --optimize=1
}
