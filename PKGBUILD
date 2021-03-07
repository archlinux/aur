# Maintainer: Alex Forencich <alex@alexforencich.com>
pkgname=python-cocotbext-eth
pkgver=0.1.6
pkgrel=1
pkgdesc="Ethernet interface modules for cocotb"
arch=('any')
url="https://github.com/alexforencich/cocotbext-eth"
license=('MIT')
depends=('python-cocotb' 'python-cocotbext-axi')
makedepends=('python-setuptools')

source=("cocotbext-eth-$pkgver.tar.gz::https://github.com/alexforencich/cocotbext-eth/archive/v$pkgver.tar.gz")
sha256sums=('3b180f4e5354e0e1ac42b5b8632ef6547e6fe4a45cb477bd4fa8a532406c3f2b')

build() {
    cd "$srcdir/cocotbext-eth-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/cocotbext-eth-$pkgver"
    python setup.py install --skip-build --prefix=/usr --root="$pkgdir/" --optimize=1
    install -m 644 -D ./LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
