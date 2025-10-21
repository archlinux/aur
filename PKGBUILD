# Maintainer: Shohei Kusakata <shohei at kusakata dot com>

pkgname='python-sudachipy'
_module='SudachiPy'
_src_folder='sudachipy-0.6.10'
pkgver='0.6.10'
pkgrel=1
pkgdesc="Python version of Sudachi, the Japanese Morphological Analyzer"
url="https://worksapplications.github.io/Sudachi/"
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools-rust' 'python-wheel')
license=('Apache-2.0')
arch=('any')
source=("https://files.pythonhosted.org/packages/86/eb/ceadfb1e9178332839a75b91393765b135ab870fad9230d47c201c931607/sudachipy-0.6.10.tar.gz")
sha256sums=('b8910a4610de98b2c3cb6dc3362fea93e3ba5059f1eb445a68baa9585278f31b')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {

    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
