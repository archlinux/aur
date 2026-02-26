# Maintainer: Clemens Brunner <clemens dot brunner at gmail dot com>
pkgname=python-edfio
_name=${pkgname#python-}
pkgver=0.4.13
pkgrel=2
pkgdesc="Python package for reading and writing EDF and EDF+C files"
arch=('any')
url="https://github.com/the-siesta-group/edfio"
license=('Apache-2.0')
depends=('python' 'python-numpy')
makedepends=('python-build' 'python-hatchling' 'python-hatch-vcs' 'python-installer')
source=(https://files.pythonhosted.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz)
sha256sums=('1744a7e7fc354d4e39082edcd4cac72ec1fa13414ca8a07c630d35f78da6c4dd')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    mkdir -p "$pkgdir/usr/share/applications"
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
