# Maintainer: vvxxp8 <concatenate[g] the characters[x] in square[b] brackets[1] in[5] order[3] at gmail dot com>

pkgname=python-latex-ocr-server
pkgver=0.1.0
_archive=latex_ocr_server-${pkgver}
pkgrel=1
pkgdesc="A protobuf-based service to generate latex equations from image files"
arch=(x86_64)
url="https://github.com/lucasvanmol/latex-ocr-server"
depends=(python-huggingface-hub)
makedepends=(
    python-build
    python-installer
    python-setuptools
    python-wheel
    python-hatchling
)
source=("${_archive}.tar.gz::https://github.com/lucasvanmol/latex-ocr-server/releases/download/${pkgver}/${_archive}.tar.gz")
sha512sums=('44a40bc4cc175233da9fdb23cbd4e7f4ac7eae15f94a39a4cd93e66a034c1a58122db23b953af28cad83df4f38eb6c4ad35c5a0d5a3a296f7a925c9cbd11d2f8')

build() {
    cd "$_archive"

    python -m build --wheel --no-isolation
}

package() {
    cd "$_archive"

    python -m installer --destdir="$pkgdir" dist/*.whl
}
