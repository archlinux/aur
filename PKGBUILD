# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-115
_name=${pkgname//-/_}
pkgver=0.0.9.8.6
pkgrel=0
epoch=
pkgdesc="Python wrapper for 115 webdisk."
arch=('any')
url="https://pypi.org/project/python-115"
license=(MIT)
groups=()
provides=(${_name})
conflicts=(${_name})
depends=(
    python
    python-httpx
    python-orjson
    python-requests
    python-urllib3)
makedepends=(
    python-poetry
    python-build
    python-installer
    python-wheel
    python-setuptools)
options=('!strip')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=('b50ebc3a6907ac2b4df8b8b97bcafe287ba545961d4882bde6062ae36914b56e')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
