# Maintainer: Majorx234 <majorx234@gmail.com>

_pkgname=docling-core
_pipname="${_pkgname//-/_}"
pkgname="python-${_pkgname}"
pkgver=2.62.0
pkgrel=1
pkgdesc="A python library to define and validate data types in Docling."
arch=('any')
url="https://github.com/docling-project/docling-core"
license=('MIT')
depends=(python-jsonschema python-jsonref python-tabulate python-pandas python-pillow python-pydantic python-pyyaml python-typing_extensions python-typer python-latex2mathml)
makedepends=('python-build' 'python-installer' 'python-pdm-backend' 'python-wheel' 'python-hatchling')
source=("$pkgname-$pkgver.tar.gz::https://github.com/docling-project/docling-core/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('5ead869e6891c241cbf1953b6229ea5774389d434f2bd873567dea29d3ad95d0')

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
