# Maintainer: quietvoid <tcChlisop0@gmail.com>

pkgname=wahoomc
pkgver=4.1.1
pkgrel=1
pkgdesc='wahooMapsCreator - Create maps for Wahoo device based on latest OSM maps'
_outname="${pkgname}-${pkgver}"
_rootdir="wahooMapsCreator-${pkgver}"
arch=('x86_64')
url='https://github.com/treee111/wahooMapsCreator'
license=('MIT')
depends=('gdal' 'osmosis' 'osmium-tool' 'python-gdal' 'python-geojson' 'python-shapely')
makedepends=('python-build' 'python-installer' 'python-wheel')
optdepends=('phyghtmap')
provides=('wahoomc')
conflicts=('wahoomc')
source=("${_outname}.tar.gz::https://github.com/treee111/wahooMapsCreator/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4df2d5705555158fcfd04ceb02ddc0c62d3a0e7f34b7d92c32d80703520b48de')

build() {
    cd "${_rootdir}"
    python -m build --wheel
}

package() {
    cd "${_rootdir}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
