# Maintainer: Smoolak <smoolak@gmail.com>

pkgname='python-rotary-embedding-torch'
_module='rotary-embedding-torch'
_src_folder="rotary_embedding_torch-0.8.9"
pkgver=0.8.9
pkgrel=1
pkgdesc="Rotary Embedding - Pytorch"
url="https://github.com/lucidrains/rotary-embedding-torch"
depends=('python' 'python-pytorch' 'python-einops')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/r/rotary-embedding-torch/rotary_embedding_torch-$pkgver.tar.gz")
sha256sums=('b213f153cad1d108064d930544fb3af678d56515893d3f869a7a146f87997e3f')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
