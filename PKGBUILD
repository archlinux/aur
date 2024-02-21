pkgname='pip2pkgbuild'
_module='pip2pkgbuild'
_src_folder='pip2pkgbuild-0.3.8'
pkgver='0.3.8'
pkgrel=1
pkgdesc="Generate PKGBUILD file for a Python module from PyPI"
url="https://github.com/wenLiangcan/pip2pkgbuild"
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/cb/88/5a2145cb54ddea56ac421125f9da03810f76fc6a101b63d85b730b797fef/pip2pkgbuild-0.3.8.tar.gz")
sha256sums=('daf72e21c9d07e4f687bc638fe8af059875683045b87b25301b7efc0411415ee')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {
    depends+=()
    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
