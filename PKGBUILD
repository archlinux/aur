# Maintainer: Alex Forencich <alex@alexforencich.com>
pkgname=python-cocotbext-uart
pkgver=0.1.0
pkgrel=1
pkgdesc="UART modules for cocotb"
arch=('any')
url="https://github.com/alexforencich/cocotbext-uart"
license=('MIT')
depends=('python-cocotb')
makedepends=('python-setuptools')

source=("cocotbext-uart-$pkgver.tar.gz::https://github.com/alexforencich/cocotbext-uart/archive/v$pkgver.tar.gz")
sha256sums=('0ca118df846833c53f120752de0d676419f7c5683bf9a8d18069f058fb946115')

build() {
    cd "$srcdir/cocotbext-uart-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/cocotbext-uart-$pkgver"
    python setup.py install --skip-build --prefix=/usr --root="$pkgdir/" --optimize=1
    install -m 644 -D ./LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
