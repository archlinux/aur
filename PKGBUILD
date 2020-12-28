# Maintainer: Alex Forencich <alex@alexforencich.com>
pkgname=python-cocotbext-eth
pkgver=0.1.4
pkgrel=1
pkgdesc="Ethernet interface modules for cocotb"
arch=('any')
url="https://github.com/alexforencich/cocotbext-eth"
license=('MIT')
depends=('python-cocotb' 'python-cocotbext-axi')
makedepends=('python-setuptools')

source=("cocotbext-eth-$pkgver.tar.gz::https://github.com/alexforencich/cocotbext-eth/archive/v$pkgver.tar.gz")
sha256sums=('30a5e0c13d3b61d65fd12b91f808c08875ee441fdb064d42c71428f034134ced')

build() {
    cd "$srcdir/cocotbext-eth-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/cocotbext-eth-$pkgver"
    python setup.py install --skip-build --prefix=/usr --root="$pkgdir/" --optimize=1
    install -m 644 -D ./LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
