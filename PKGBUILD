# Maintainer: devome <evinedeng@hotmail.com>

_pkgname=ndjson
pkgname="python-${_pkgname}"
pkgver=0.3.1
pkgrel=1
pkgdesc="JsonDecoder for ndjson"
arch=("any")
url="https://github.com/rhgrant10/${_pkgname}"
license=('GPL-3.0-or-later')
depends=("python")
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-pytest-runner' 'python-wheel')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('bf9746cb6bb1cb53d172cda7f154c07c786d665ff28341e4e689b796b229e5d6')

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
