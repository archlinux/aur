# Maintainer: Oystein Sture <oysstu a.t gmail.com>
# Contributor:

pkgname=python-pyvistaqt
pkgver=0.11.1
pkgrel=2
_pkgbase=${pkgname#python-}
pkgdesc="Qt support for PyVista"
arch=("any")
license=("MIT")
url="https://github.com/pyvista/pyvistaqt"
depends=('python' 'python-pyvista' 'python-qtpy')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgbase::1}/$_pkgbase/$_pkgbase-$pkgver.tar.gz")
sha256sums=('5403bfeb82cf063288107a9be9780ca3ca70948e73d33d16a65a83a711d51a36')

build() {
    cd "$_pkgbase-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_pkgbase-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
