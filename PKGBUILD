# Maintainer: dianlujitao <dianlujitao at gmail dot com>

pkgname=python-hdf5storage
pkgver=0.1.18
pkgrel=1
pkgdesc="Read and write a wide range of Python types to/from HDF5 formatted files."
url="https://github.com/frejanordsiek/hdf5storage"
depends=('python' 'python-numpy' 'python-h5py')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://github.com/frejanordsiek/hdf5storage/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('ce24b6267d1f59964b116cfa604c3142a1c9d7ac3a4704bca84963d820265e58')

build() {
    cd hdf5storage-$pkgver
    python setup.py build
}

package() {
    cd hdf5storage-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1
    install -Dm644 COPYING.txt $pkgdir/usr/share/licenses/$pkgname/COPYING.txt
}
