# Maintainer: Alex Forencich <alex@alexforencich.com>
pkgname=python-cocotbext-i2c
pkgver=0.1.0
pkgrel=1
pkgdesc="I2C modules for cocotb"
arch=('any')
url="https://github.com/alexforencich/cocotbext-i2c"
license=('MIT')
depends=('python-cocotb')
makedepends=('python-setuptools')

source=("cocotbext-i2c-$pkgver.tar.gz::https://github.com/alexforencich/cocotbext-i2c/archive/v$pkgver.tar.gz")
sha256sums=('ff5d87849a3d8da87942dd465f6bcefb57edfe21e9540c0f5a6c863f2bfa3c83')

build() {
    cd "$srcdir/cocotbext-i2c-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/cocotbext-i2c-$pkgver"
    python setup.py install --skip-build --prefix=/usr --root="$pkgdir/" --optimize=1
    install -m 644 -D ./LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
