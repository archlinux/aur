_pyname=geo-picture-tag-reader
pkgname=python-${_pyname}
pkgver=1.4.1
pkgrel=1
pkgdesc="Read and write standardized metadata from geolocated pictures EXIF metadata"
arch=(any)
url="https://gitlab.com/panoramax/server/geo-picture-tag-reader"
license=('MIT')
depends=('python>=3.8' 'python-pyexiv2' 'python-pytz' 'python-timezonefinder' 'python-typer' 'python-types-python-dateutil' 'python-types-pytz' 'python-xmltodict')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel' 'python-flit-core')
optdepends=()
conflicts=()
source=("https://gitlab.com/panoramax/server/geo-picture-tag-reader/-/archive/${pkgver}/geo-picture-tag-reader-${pkgver}.tar.gz")
b2sums=('3339e644465e13bbdc5c6b8a522a5caea70548519206e34d5cbb4d355bb483a1e14c7ece7cdf1575e11832e543824843ed4bbef07be86a8e117c7c7398cc1be4')

build() {
  cd "${_pyname}-${pkgver}"
  python -m build -wn
}

package() {
  cd "${_pyname}-${pkgver}"
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
