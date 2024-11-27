pkgname=python-pyqtdarktheme-fork
_name=pyqtdarktheme_fork
pkgver=2.3.2
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
sha256sums=('3ea94fed5df262d960378409357c63032639f749794d766f41a45ad8558b2523')


build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
