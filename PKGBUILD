# Maintainer: berocs <brandweineric at gmail dot com>
pkgname=python-simperium
pkgver=0.1.2
pkgrel=1
pkgdesc="Python 3 client for the Simperium synchronization platform"
arch=(any)
url="https://github.com/swalladge/simperium-python3"
license=("MIT")
depends=('python-requests')
makedepends=('python' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/8c/35/9bda4f31bf4150a01e2b1f8c8f00a5c896533e9d9498a1563a19f22e58ed/Simperium3-${pkgver}.tar.gz")
sha256sums=("a9f7581d1a2d457fa6aaaefa659b56c1c62b3f231e6fb037830d8410a529ddea")

build() {
    cd "$srcdir/Simperium3-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/Simperium3-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
