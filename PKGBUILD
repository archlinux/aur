pkgname=python-pyqtdarktheme-fork
_name=pyqtdarktheme_fork
pkgver=2.3.4
pkgrel=3
pkgdesc='Flat dark theme for PySide and PyQt'
arch=('any')
url='https://pypi.org/project/pyqtdarktheme-fork'
license=('MIT')
depends=('python' 'python-darkdetect')
optdepends=()
makedepends=('python-build' 'python-installer' 'python-wheel' 'poetry')
provides=('pyqtdarktheme')
conflicts=('python-pyqtdarktheme')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('2a5fab9d2122e52f772a7088e87be1fc0af767346e5fa0b1333e6813ebb2116c')


build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
