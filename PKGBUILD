# Maintainer: sga013
pkgname='python-powerxrd'
_module='powerxrd'
_src_folder='powerxrd-3.0.0'
pkgver='3.0.0'
pkgrel=1
pkgdesc="Simple tools to handle powder XRD (and XRD) data with Python."
url="https://github.com/andrewrgarcia/powerxrd"
depends=('python' 'python-numpy' 'python-pandas' 'python-scipy' 'python-matplotlib')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-poetry-core')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/ee/16/90c4a086ca7f699f99422b216e9628e39253966861652831b4dd7319c18b/powerxrd-3.0.0.tar.gz")
sha256sums=('d62b7d1914e7ac993c2c3f56fffa2fbf6f741f0bc68d399de1e726d7b97aa420')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {

    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
