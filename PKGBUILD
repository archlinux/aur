# Maintainer: sga013
pkgname='python-powerxrd'
_module='powerxrd'
_src_folder='powerxrd-2.3.0'
pkgver='2.3.0'
pkgrel=1
pkgdesc="Simple tools to handle powder XRD (and XRD) data with Python."
url="https://github.com/andrewrgarcia/powerxrd"
depends=('python' 'python-numpy' 'python-pandas' 'python-scipy' 'python-matplotlib')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-poetry-core')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/7c/5f/e091ae5d2e459bbe63027b5155d00ba8c39d816df8812fe932a12f7f2fc5/powerxrd-2.3.0.tar.gz")
sha256sums=('5c979e0de85c27e860819846994d03ffd3693a0f06bcf6a968bde339b2dc7492')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {

    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
