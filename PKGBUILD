_pyname=geo-picture-tag-reader
pkgname=python-${_pyname}
pkgver=1.8.0
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
b2sums=('fbbbae9b4f4fe47afcd6e5ab2053aa4954fc0e746b529a204991a9f648d829d476207fd8adfe2d275199c33ebb20118f92a7ec06ffcda021d253b36ba3da8633')

build() {
  cd "${_pyname}-${pkgver}"
  python -m build -wn
}

package() {
  cd "${_pyname}-${pkgver}"
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
