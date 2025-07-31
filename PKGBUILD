# Maintainer: Oystein Sture <oysstu a.t gmail.com>
# Contributor:

pkgname=python-pyvistaqt
pkgver=0.11.3
pkgrel=1
_pkgbase=${pkgname#python-}
pkgdesc="Qt support for PyVista"
arch=("any")
license=("MIT")
url="https://github.com/pyvista/pyvistaqt"
depends=('python' 'python-pyvista' 'python-qtpy')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'python-setuptools-scm')
source=("https://files.pythonhosted.org/packages/source/${_pkgbase::1}/$_pkgbase/$_pkgbase-$pkgver.tar.gz")
sha256sums=('b45cceaee5013a9f98fec3c5de175f5af897f3a6c558bf65c600a0812c20beba')

build() {
    cd "$_pkgbase-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_pkgbase-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
