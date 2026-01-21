# Maintainer: Clemens Brunner <clemens dot brunner at gmail dot com>
pkgname=python-pyxdf
_name=${pkgname#python-}
pkgver=1.17.3
pkgrel=1
pkgdesc="Python importer for XDF files"
arch=('any')
url="https://github.com/xdf-modules/pyxdf"
license=('BSD')
groups=()
depends=('python' 'python-numpy')
makedepends=('python-build' 'python-hatchling' 'python-hatch-vcs' 'python-installer')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(https://files.pythonhosted.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz)
noextract=()
sha1sums=('bbfc905cc46022fd3d5ef672b500632093335faa')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
