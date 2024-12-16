# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-115
_name=${pkgname//-/_}
pkgver=0.0.9.8.8.3
pkgrel=1
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
sha256sums=('c6c71a37650a826a17062a5b1feab8d28406a626853f3ce7e45ce27df8df75ab')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
