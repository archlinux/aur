# Maintainer: Martins Mozeiko <martins.mozeiko@gmail.com>

pkgname='python-serializd'
pkgver=0.1.4
pkgrel=1
_commit=000250165adfee8fe014b514381dc10dab7183d7
pkgdesc="Python API library for Serializd.com"
arch=('any')
url="https://github.com/Velocidensity/serializd-py"
license=('MIT')
depends=(
  'python'
  'python-httpx'
  'python-pydantic'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-poetry'
)

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${_commit}.tar.gz")
sha256sums=('0f0bba2a632019fe68ac4a6bdfdb88fb28b4961bb0020e6a99b6937ed74c45f2')

build() {
    cd "serializd-py-${_commit}"
    python -m build --wheel --no-isolation
}

package() {
    cd "serializd-py-${_commit}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
