# Maintainer: quietvoid <tcChlisop0@gmail.com>

pkgname=wahoomc
pkgver=v4.1.0
pkgrel=1
pkgdesc='wahooMapsCreator - Create maps for Wahoo device based on latest OSM maps'
_outname="${pkgname}-${pkgver}"
_rootdir="wahooMapsCreator-${pkgver#v}"
arch=('x86_64')
url='https://github.com/treee111/wahooMapsCreator'
license=('MIT')
depends=('gdal' 'osmosis' 'osmium-tool' 'python-geojson' 'python-shapely')
makedepends=('python-build' 'python-installer' 'python-wheel')
optdepends=('phyghtmap')
provides=('wahoomc')
conflicts=('wahoomc')
source=("${_outname}.tar.gz::https://github.com/treee111/wahooMapsCreator/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('ea3b14d2d482a2418dcadc2bd25259e84f6e62dd97e35235156b5d99207312c2')

build() {
    cd "${_rootdir}"
    python -m build --wheel
}

package() {
    cd "${_rootdir}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
