# Maintainer: quietvoid <tcChlisop0@gmail.com>

pkgname=wahoomc
pkgver=4.2.0
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
sha256sums=('083794ec046d049769ee46647b14348ff56f26b3aff52c01c5519763f1506c17')

build() {
    cd "${_rootdir}"
    python -m build --wheel
}

package() {
    cd "${_rootdir}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
