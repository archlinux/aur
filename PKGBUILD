# Maintainer: Joao Freitas <joaj dot freitas at gmail dot com>

pkgname=python-pyqtdarktheme
_name=${pkgname#python-}
pkgver=2.1.0
pkgrel=3
pkgdesc='Flat dark theme for PySide and PyQt'
arch=('any')
url='https://pypi.org/project/pyqtdarktheme'
license=('MIT')
depends=('python')
optdepends=()
makedepends=('python-build' 'python-installer' 'python-wheel' 'poetry' 'python-darkdetect')
provides=('pyqtdarktheme')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('5f8274ddfa3a5481ed9743cdb0f9debfeb7ff695b3a0d202a8104361d17dadb8')


build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
