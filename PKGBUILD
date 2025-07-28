# Maintainer: Octopus118 <idlansdowne at gmail dot com>

pkgname=python-pyromat
_name=${pkgname#python-}
pkgver=2.2.6
pkgrel=1
pkgdesc="Thermodynamic properties in Python"
url="https://github.com/chmarti1/PYroMat"
arch=('any')
license=('GPL-3.0-only')
depends=('python-numpy')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')

source=("git+https://github.com/chmarti1/PYroMat#tag=v$pkgver")
sha256sums=('7705459a33604dd1b567dae9df6caa5cfcb687c7aa3b735c6160486e4b62a79c')

build() {
    cd "$srcdir/PYroMat"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/PYroMat"
    python -m installer --destdir="$pkgdir" "$srcdir/PYroMat/dist/PYroMat-$pkgver-py3-none-any.whl"
}
