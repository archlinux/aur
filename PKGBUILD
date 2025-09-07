# Maintainer: Alex Forencich <alex@alexforencich.com>
pkgname=python-cocotbext-i2c
pkgver=0.1.2
pkgrel=1
pkgdesc="I2C modules for cocotb"
arch=('any')
url="https://github.com/alexforencich/cocotbext-i2c"
license=('MIT')
depends=('python-cocotb')
makedepends=('python-setuptools')

source=("cocotbext-i2c-$pkgver.tar.gz::https://github.com/alexforencich/cocotbext-i2c/archive/v$pkgver.tar.gz")
sha256sums=('bfe302e26167121fa9adeb0fa3cf231461f962536bd2f0be4017747f60a710f6')

build() {
    cd "$srcdir/cocotbext-i2c-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/cocotbext-i2c-$pkgver"
    python setup.py install --skip-build --prefix=/usr --root="$pkgdir/" --optimize=1
    install -m 644 -D ./LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
