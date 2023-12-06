pkgname='pip2pkgbuild'
_module='pip2pkgbuild'
_src_folder='pip2pkgbuild-0.3.6'
pkgver='0.3.6'
pkgrel=1
pkgdesc="Generate PKGBUILD file for a Python module from PyPI"
url="https://github.com/wenLiangcan/pip2pkgbuild"
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/57/c0/fab326e6479f0d19be95fa12171dd7ec21d9d45fd886981cb71efec2e242/pip2pkgbuild-0.3.6.tar.gz")
sha256sums=('fd9880aaf0aba7cd6d6bb9e867f40de19511d6d45a5cb315ddf4804f91a16b2b')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {
    depends+=()
    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
