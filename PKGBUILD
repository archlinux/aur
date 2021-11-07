# Maintainer: Alex Forencich <alex@alexforencich.com>
pkgname=python-cocotbext-uart
pkgver=0.1.2
pkgrel=1
pkgdesc="UART modules for cocotb"
arch=('any')
url="https://github.com/alexforencich/cocotbext-uart"
license=('MIT')
depends=('python-cocotb')
makedepends=('python-setuptools')

source=("cocotbext-uart-$pkgver.tar.gz::https://github.com/alexforencich/cocotbext-uart/archive/v$pkgver.tar.gz")
sha256sums=('50cc82a39b010c6979fd80784e8966f01b9efe44301a871548eb5350bc6e4561')

build() {
    cd "$srcdir/cocotbext-uart-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/cocotbext-uart-$pkgver"
    python setup.py install --skip-build --prefix=/usr --root="$pkgdir/" --optimize=1
    install -m 644 -D ./LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
