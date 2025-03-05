# Maintainer: Clemens Brunner <clemens dot brunner at gmail dot com>
pkgname=python-pybv
_name=${pkgname#python-}
pkgver=0.7.6
pkgrel=1
pkgdesc="A lightweight I/O utility for the BrainVision data format"
arch=('any')
url="https://github.com/bids-standard/pybv"
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
sha1sums=('174b94f89afd2333199cd87fa097eedc233636be')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    mkdir -p "$pkgdir/usr/share/applications"
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
