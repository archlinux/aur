# Maintainer: dobedobedo <dobe0331 at gmail dot com>
pkgname=('python-pysolar')
pkgver=0.10
pkgrel=1
pkgdesc="Collection of Python libraries for simulating the irradiation of any point on earth by the sun. It includes code for extremely precise ephemeris calculations."
arch=('x86_64')
depends=('python'
         'python-numpy'
         'python-setuptools'
	)
url='http://pysolar.org/'
license=('GPLv3')
md5sums=('517b66360690f90ad4b5b1451562850c')
source=("https://github.com/pingswept/pysolar/archive/$pkgver.tar.gz")

build() {
    cd "$srcdir/pysolar-$pkgver/"
    python setup.py build
}

package() {
    cd "$srcdir/pysolar-$pkgver/"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
} 
