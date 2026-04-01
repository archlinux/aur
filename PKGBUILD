# Maintainer: Clemens Brunner <clemens dot brunner at gmail dot com>
pkgname=python-pyxdf
_name=${pkgname#python-}
pkgver=1.17.4
pkgrel=1
pkgdesc="Python importer for XDF files"
arch=('any')
url="https://github.com/xdf-modules/pyxdf"
license=('BSD-2-Clause')
depends=('python' 'python-numpy')
makedepends=('python-build' 'python-hatchling' 'python-hatch-vcs' 'python-installer')
source=(https://files.pythonhosted.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz)
noextract=()
sha1sums=('04f753345cbaa0d276ccf28be475dfa7ec24ca04')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
