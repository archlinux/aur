pkgname='pip2pkgbuild'
_module='pip2pkgbuild'
_src_folder='pip2pkgbuild-0.3.7'
pkgver='0.3.7'
pkgrel=1
pkgdesc="Generate PKGBUILD file for a Python module from PyPI"
url="https://github.com/wenLiangcan/pip2pkgbuild"
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/17/08/7975ed03bca3a842b7f61d6c8b8a82c9486866440a3905c57448e5f74cde/pip2pkgbuild-0.3.7.tar.gz")
sha256sums=('554d065b6b90f1ae52cbb4ab560385683bbc7e750563b081c558dacd40dbeff9')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {
    depends+=()
    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
