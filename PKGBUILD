# Maintainer: Oystein Sture <oysstu a.t gmail.com>
# Contributor:

pkgname=python-pyvistaqt
pkgver=0.11.0
pkgrel=1
_pkgbase=${pkgname#python-}
pkgdesc="Qt support for PyVista"
arch=("any")
license=("MIT")
url="https://github.com/pyvista/pyvistaqt"
depends=('python' 'python-pyvista' 'python-qtpy')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgbase::1}/$_pkgbase/$_pkgbase-$pkgver.tar.gz")
sha256sums=('8784e8ced4faacfe010524b20dd5675f81f25f1b1d6fb6442ba70437cbb6b1ef')

build() {
    cd "$_pkgbase-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_pkgbase-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
