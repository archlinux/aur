pkgname='python-pymp4'
_module='pymp4'
_src_folder='pymp4-1.4.0'
pkgver='1.4.0'
pkgrel=1
pkgdesc="Python parser for MP4 boxes"
url="https://github.com/beardypig/pymp4"
depends=('python' 'python-construct')
makedepends=('python-poetry-core' 'python-build' 'python-installer' 'python-wheel')
license=('Apache')
arch=('any')
source=("https://files.pythonhosted.org/packages/a5/46/dfb3f5363fc71adaf419147fdcb93341029ca638634a5cc6f7e7446416b2/pymp4-1.4.0.tar.gz")
sha256sums=('bc9e77732a8a143d34c38aa862a54180716246938e4bf3e07585d19252b77bb5')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {

    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
