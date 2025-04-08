# Maintainer: Octopus118 <idlansdowne at gmail dot com>

pkgname=python-pyromat
_name=${pkgname#python-}
pkgver=2.2.5
pkgrel=1
pkgdesc="Thermodynamic properties in Python"
url="https://github.com/chmarti1/PYroMat"
arch=('any')
license=('GPL-3.0-only')
depends=('python-numpy')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')

source=("git+https://github.com/chmarti1/PYroMat#tag=v$pkgver")
sha256sums=('d0438b34276bd29a2fdfb9eef4b84240c228162f20359c620ac9977b5f8d2431')

build() {
    cd "$srcdir/PYroMat"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/PYroMat"
    python -m installer --destdir="$pkgdir" "$srcdir/PYroMat/dist/PYroMat-$pkgver-py3-none-any.whl"
}
