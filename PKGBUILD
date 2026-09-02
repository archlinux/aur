# Maintainer: Oystein Sture <oysstu a.t gmail.com>
# Contributor:

pkgname=python-pyvistaqt
_name=${pkgname#python-}
pkgver=0.13.0
pkgrel=1
_pkgbase=${pkgname#python-}
pkgdesc="Qt support for PyVista"
arch=("any")
license=("MIT")
url="https://github.com/pyvista/pyvistaqt"
depends=('python' 'python-pyvista' 'python-qtpy')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'python-setuptools-scm')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('fb8efda9289fc1b6456b04b1ed1497c02b8178d634fbb5e832134a2f6b46be6e')

build() {
    cd "$_pkgbase-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_pkgbase-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
