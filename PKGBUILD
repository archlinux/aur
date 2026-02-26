# Maintainer: Clemens Brunner <clemens dot brunner at gmail dot com>
pkgname=python-pymatreader
_name=${pkgname#python-}
pkgver=1.1.0
pkgrel=1
pkgdesc="Python reader for MATLAB .mat files"
arch=('any')
url="https://pymatreader.readthedocs.io/en/latest/"
license=('BSD')
groups=()
depends=('python' 'python-numpy' 'python-scipy' 'python-h5py' 'python-xmltodict')
makedepends=('python-build' 'python-installer' 'python-hatchling' 'python-hatch-regex-commit')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(https://files.pythonhosted.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz)
noextract=()
sha1sums=('2c1a936657434d837e91f756cf62edc9cc9e5ade')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
