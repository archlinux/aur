# Maintainer: sga013
pkgname='python-powerxrd'
_module='powerxrd'
_src_folder='powerxrd-2.3.1'
pkgver='2.3.1'
pkgrel=1
pkgdesc="Simple tools to handle powder XRD (and XRD) data with Python."
url="https://github.com/andrewrgarcia/powerxrd"
depends=('python' 'python-numpy' 'python-pandas' 'python-scipy' 'python-matplotlib')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-poetry-core')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/f8/2b/ca02c72bf6e4f9d84e3283f4db2c106232a4ceb07d9cc9e2775146c0bffa/powerxrd-2.3.1.tar.gz")
sha256sums=('48fc69de47bdb948f2aa0c5bf1166b6c0099484a65ed795f49a98ec4a27173f0')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {

    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
