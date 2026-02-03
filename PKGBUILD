# Maintainer: Majorx234 <majorx234@gmail.com>

_pkgname=docling-ibm-models
_pipname="${_pkgname//-/_}"
pkgname="python-${_pkgname}"
pkgver=3.11.0
pkgrel=1
pkgdesc="A python library to define and validate data types in Docling."
arch=('any')
url="https://github.com/docling-project/docling-ibm-models"
license=('MIT')
depends=(python-pytorch python-torchvision python-jsonlines python-pillow python-tqdm python-pydantic python-huggingface-hub python-safetensors python-docling-core python-transformers python-numpy python-rtree python-accelerate)
makedepends=('python-build' 'python-installer' 'python-pdm-backend' 'python-wheel' 'python-hatchling')
source=("$pkgname-$pkgver.tar.gz::https://github.com/docling-project/docling-ibm-models/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4450e69017a0829048bef1dd569e06d8a7a194abdfc1d46b4f3ab4ee92e76d02')

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
