# Maintainer: Clemens Brunner <clemens dot brunner at gmail dot com>
pkgname=python-h5io
_name=${pkgname#python-}
pkgver=0.2.5
pkgrel=1
pkgdesc="Python package for saving standard objects to forward-compatible HDF5 files"
arch=('any')
url="https://github.com/h5io/h5io/tree/main"
license=('BSD')
groups=()
depends=('python' 'python-numpy' 'python-h5py')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-setuptools-scm')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(https://files.pythonhosted.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz)
noextract=()
sha1sums=('539669f8bbdb9a5341afc731fcb0b0a5ee1e6cff')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
