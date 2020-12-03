# Maintainer: dianlujitao <dianlujitao at gmail dot com>

pkgname=python-hdf5storage
pkgver=0.1.16
_commit=d6e44f83ce2e25f7a5026cdac59b2ac74d832936
pkgrel=2
pkgdesc="Python package to read and write a wide range of Python types to/from HDF5 formatted files."
url="https://github.com/frejanordsiek/hdf5storage"
depends=('python' 'python-numpy' 'python-h5py')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("$pkgname-$_commit.tar.gz::https://github.com/frejanordsiek/hdf5storage/archive/$_commit.tar.gz")
sha256sums=('c361f8c49af17a624bee017edf4b6ca9e6ac47703092c9356dbaf9647ccd99c7')

build() {
    cd hdf5storage-$_commit
    python setup.py build
}

package() {
    cd hdf5storage-$_commit
    python setup.py install --root="$pkgdir" --optimize=1
    install -Dm644 COPYING.txt $pkgdir/usr/share/licenses/$pkgname/COPYING.txt
}
