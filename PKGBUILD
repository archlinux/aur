# Maintainer: Alex Forencich <alex@alexforencich.com>
pkgname=python-cocotbext-uart
pkgver=0.1.4
pkgrel=1
pkgdesc="UART modules for cocotb"
arch=('any')
url="https://github.com/alexforencich/cocotbext-uart"
license=('MIT')
depends=('python-cocotb')
makedepends=('python-setuptools')

source=("cocotbext-uart-$pkgver.tar.gz::https://github.com/alexforencich/cocotbext-uart/archive/v$pkgver.tar.gz")
sha256sums=('a1d2d18b6c87b346e3649cd426f328fc219866eb3e113c7b6c60e05ce48a46fd')

build() {
    cd "$srcdir/cocotbext-uart-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/cocotbext-uart-$pkgver"
    python setup.py install --skip-build --prefix=/usr --root="$pkgdir/" --optimize=1
    install -m 644 -D ./LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
