# Maintainer: dianlujitao <dianlujitao at gmail dot com>

pkgname=python-hdf5storage
pkgver=0.1.19
pkgrel=1
pkgdesc="Read and write a wide range of Python types to/from HDF5 formatted files."
url="https://github.com/frejanordsiek/hdf5storage"
depends=('python' 'python-numpy' 'python-h5py')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://github.com/frejanordsiek/hdf5storage/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9618d370277ad2a38dc3981d1f67fe02e8a413e1a682990526dafa689dc2b32f')

build() {
    cd hdf5storage-v$pkgver
    python setup.py build
}

package() {
    cd hdf5storage-v$pkgver
    python setup.py install --root="$pkgdir" --optimize=1
    install -Dm644 COPYING.txt $pkgdir/usr/share/licenses/$pkgname/COPYING.txt
}
