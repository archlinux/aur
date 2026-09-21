# Maintainer: Clemens Brunner <clemens dot brunner at gmail dot com>
pkgname=python-edfio
_name=${pkgname#python-}
pkgver=0.4.17
pkgrel=1
pkgdesc="Python package for reading and writing EDF and EDF+C files"
arch=('any')
url="https://github.com/the-siesta-group/edfio"
license=('Apache-2.0')
depends=('python' 'python-numpy')
makedepends=('python-build' 'python-hatchling' 'python-hatch-vcs' 'python-installer')
source=(https://files.pythonhosted.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz)
sha256sums=('e28d6000f9e6397014ff92bcbe933ecc2c237e3ba23ee976b6a752c62a0b2c21')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    mkdir -p "$pkgdir/usr/share/applications"
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
