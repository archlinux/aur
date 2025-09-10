# Maintainer: dobedobedo <dobe0331 at gmail dot com>
pkgname=('python-pysolar')
pkgver=0.13
pkgrel=2
pkgdesc="Collection of Python libraries for simulating the irradiation of any point on earth by the sun. It includes code for extremely precise ephemeris calculations."
arch=('x86_64')
depends=('python'
         'python-numpy'
	)
makedepends=('python-build' 
	     'python-installer' 
             'python-wheel'
             'python-setuptools'
            )
url='http://pysolar.org/'
license=('GPLv3')
md5sums=('31a748765fd91dfd23a55b0a7201a549')
source=("https://github.com/pingswept/pysolar/archive/$pkgver.tar.gz")

build() {
    cd "$srcdir/pysolar-$pkgver/"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/pysolar-$pkgver/"
    python -m installer --destdir="$pkgdir" dist/*.whl
} 
