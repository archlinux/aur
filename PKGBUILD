_pyname=geo-picture-tag-reader
pkgname=python-${_pyname}
pkgver=1.4.2
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
b2sums=('89ac4baa3faeb9a9dbc2aa25b8d4deda54569fad89ad28f869773ab5c2afd0114677d3cdaf03289d685f2e8d37428a5c73da347ae092a41ed49ed9478145a668')

build() {
  cd "${_pyname}-${pkgver}"
  python -m build -wn
}

package() {
  cd "${_pyname}-${pkgver}"
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
