_pyname=geo-picture-tag-reader
pkgname=python-${_pyname}
pkgver=1.8.1
pkgrel=1
pkgdesc="Read and write standardized metadata from geolocated pictures EXIF metadata"
arch=(any)
url="https://gitlab.com/panoramax/server/geo-picture-tag-reader"
license=('MIT')
depends=('python>=3.9' 'python-pyexiv2' 'python-pytz' 'python-rtree' 'python-timezonefinder' 'python-typer' 'python-types-python-dateutil' 'python-types-pytz' 'python-xmltodict')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel' 'python-flit-core')
optdepends=()
conflicts=()
source=("https://gitlab.com/panoramax/server/geo-picture-tag-reader/-/archive/${pkgver}/geo-picture-tag-reader-${pkgver}.tar.gz")
b2sums=('43b989de630b377a388f82cfe9737ebefc147ae3d16b97623c4111eebf98f7374d40a6ba71336268f14db5db54e0abaaac717891f595ad04e387d8fb6586fad8')

build() {
  cd "${_pyname}-${pkgver}"
  python -m build -wn
}

package() {
  cd "${_pyname}-${pkgver}"
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
