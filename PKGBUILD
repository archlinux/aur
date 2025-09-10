pkgname='python-bip38'
_module='bip38'
_src_folder='bip38-1.4.1'
pkgver='1.4.1'
pkgrel=1
pkgdesc="A Python library for implementation of Bitcoin Improvement Proposal - 0038 / BIP38 protocol."
url="https://hdwallet.io"
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('custom:MIT License')
arch=('any')
source=("https://files.pythonhosted.org/packages/16/10/7dba5bfef2a9ea90c2f47f20000f9a6a501eef565b6f0f58ef369f3623e8/bip38-1.4.1.tar.gz")
sha256sums=('9d37f418b833cf1802eef115f9bca085e52368c24c8dcc067d78d53c809dcd53')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {

    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
