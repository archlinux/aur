pkgbase='python-recoverpy'
pkgname=('python-recoverpy')
_module='recoverpy'
_src_folder='recoverpy-2.1.5'
pkgver='2.1.5'
pkgrel=1
pkgdesc="A TUI to recover overwritten or deleted data."
url="https://github.com/PabloLec/recoverpy"
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel')
license=(GNU GPLv3)
arch=('any')
source=("https://files.pythonhosted.org/packages/88/67/7ef7dc81c4be47620adc83b232b7a0ffd992ec312e087bc1f633a0961b1a/recoverpy-2.1.5.tar.gz")
sha256sums=('9a2a831e9945585a54ce968d877dc81983d8228cc2b5c2fbacfff5480d09a393')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {
    depends+=()
    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
