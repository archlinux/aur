# Maintainer: Clemens Brunner <clemens dot brunner at gmail dot com>
pkgname=python-edfio
_name=${pkgname#python-}
pkgver=0.4.11
pkgrel=1
pkgdesc="Python package for reading and writing EDF and EDF+C files"
arch=('any')
url="https://github.com/the-siesta-group/edfio"
license=('Apache-2.0')
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
sha1sums=('d18fbfcc50b9ba77540ed00fcae1d0dfb6dbc93c')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    mkdir -p "$pkgdir/usr/share/applications"
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
