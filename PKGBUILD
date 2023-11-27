pkgname='pip2pkgbuild'
_module='pip2pkgbuild'
_src_folder='pip2pkgbuild-0.3.5'
pkgver='0.3.5'
pkgrel=1
pkgdesc="Generate PKGBUILD file for a Python module from PyPI"
url="https://github.com/wenLiangcan/pip2pkgbuild"
depends=('python')
makedepends=('python-build' 'python-installer')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/a0/ad/ca17f7b6704986da1df26770349b55369a789effa781d96f8992c4a83bd3/pip2pkgbuild-0.3.5.tar.gz")
sha256sums=('14f5e457dcf1bef0764374c753a535fbed8c0c5c950edb2874c1b438e6fc3773')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {
    depends+=()
    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
