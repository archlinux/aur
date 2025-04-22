_pyname=geo-picture-tag-reader
pkgname=python-${_pyname}
pkgver=1.5.0
pkgrel=1
pkgdesc="Read and write standardized metadata from geolocated pictures EXIF metadata"
arch=(any)
url="https://gitlab.com/panoramax/server/geo-picture-tag-reader"
license=('MIT')
depends=('python>=3.9' 'python-pyexiv2' 'python-pytz' 'python-timezonefinder' 'python-typer' 'python-types-python-dateutil' 'python-types-pytz' 'python-xmltodict')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel' 'python-flit-core')
optdepends=()
conflicts=()
source=("https://gitlab.com/panoramax/server/geo-picture-tag-reader/-/archive/${pkgver}/geo-picture-tag-reader-${pkgver}.tar.gz")
b2sums=('1cda7b8a422500ce401cb7681b2cd4fb33c6d3d2e51a8742ecb6157fef2e7c0bc2ab8cdd4704da3f05cff9dfa9e8a6b4b4356d989a8c08d44cbac2397a824033')

build() {
  cd "${_pyname}-${pkgver}"
  python -m build -wn
}

package() {
  cd "${_pyname}-${pkgver}"
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
