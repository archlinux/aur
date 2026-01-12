# Maintainer: Clemens Brunner <clemens dot brunner at gmail dot com>
pkgname=python-pyxdf
_name=${pkgname#python-}
pkgver=1.17.2
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
sha1sums=('93feb9b84e8062f62ea95065e99ed170c2ac28cb')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
