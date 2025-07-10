pkgname='python-rotary-embedding-torch'
_module='rotary-embedding-torch'
_src_folder='rotary_embedding_torch-0.8.8'
pkgver='0.8.8'
pkgrel=1
pkgdesc="Rotary Embedding - Pytorch"
url="https://github.com/lucidrains/rotary-embedding-torch"
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('custom:MIT License')
arch=('any')
source=("https://files.pythonhosted.org/packages/3b/10/6e027abe8f8d7cf37ccf238b54c251b79e270605336fe038bd6450de7066/rotary_embedding_torch-0.8.8.tar.gz")
sha256sums=('42cdb6d997356f0f026f0b6fd7f0af84b846b84bc0353826153ad67259e244b1')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {

    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
