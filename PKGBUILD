# Maintainer: Clemens Brunner <clemens dot brunner at gmail dot com>
pkgname=python-pyxdf
_name=${pkgname#python-}
pkgver=1.16.2
pkgrel=1
pkgdesc="Python importer for XDF files"
arch=('any')
url="https://github.com/xdf-modules/xdf-Python"
license=('BSD')
groups=()
depends=('python' 'python-numpy')
makedepends=()
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
sha1sums=('7679992f575a4d68acdd7f280e16e2c8ca49176c')

build() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
