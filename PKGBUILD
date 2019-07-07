# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=mapillary_tools-git
_pkgname=mapillary_tools
pkgver=r1226.db047a3
pkgrel=1
pkgdesc="Library for processing and uploading geotagged images to Mapillary"
url="https://github.com/mapillary/mapillary_tools"
depends=('exifread' 'python2-gpxpy' 'python2-pillow' 'python2-piexif' 'python2-pytz' 'python2-yaml' 'python2-tqdm' 'python2-pynmea2' 'python2-dateutil')
license=('BSD')
arch=('any')
source=("${pkgname}"::'git+https://github.com/mapillary/mapillary_tools.git')
md5sums=('SKIP')

build() {
  cd $srcdir/${pkgname}
  python2 setup.py build
}

pkgver() {
  cd "$srcdir/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd $srcdir/${pkgname}
  python2 setup.py install --root="$pkgdir" --optimize=1 
}
