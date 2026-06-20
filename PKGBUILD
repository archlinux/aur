# Maintainer: Alex Forencich <alex@alexforencich.com>
pkgname=python-cocotbext-eth
pkgver=0.1.26
pkgrel=1
pkgdesc="Ethernet interface modules for cocotb"
arch=('any')
url="https://github.com/alexforencich/cocotbext-eth"
license=('MIT')
depends=('python-cocotb' 'python-cocotbext-axi')
makedepends=('python-setuptools')

source=("cocotbext-eth-$pkgver.tar.gz::https://github.com/alexforencich/cocotbext-eth/archive/v$pkgver.tar.gz")
sha256sums=('093dbfb67308754ee3083ae02e9487125f4e1a84debcae07447d32f42cecbffb')

build() {
    cd "$srcdir/cocotbext-eth-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/cocotbext-eth-$pkgver"
    python setup.py install --skip-build --prefix=/usr --root="$pkgdir/" --optimize=1
    install -m 644 -D ./LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
