# Maintainer: Alex Forencich <alex@alexforencich.com>
pkgname=python-cocotbext-eth
pkgver=0.1.2
pkgrel=1
pkgdesc="Ethernet interface modules for cocotb"
arch=('any')
url="https://github.com/alexforencich/cocotbext-eth"
license=('MIT')
depends=('python-cocotb' 'python-cocotbext-axi')
makedepends=('python-setuptools')

source=("cocotbext-eth-$pkgver.tar.gz::https://github.com/alexforencich/cocotbext-eth/archive/v$pkgver.tar.gz")
sha256sums=('441488c660753a2d615da994b1c77af26ec8a95e0ece912a034250cd5cd96ebd')

build() {
    cd "$srcdir/cocotbext-eth-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/cocotbext-eth-$pkgver"
    python setup.py install --skip-build --prefix=/usr --root="$pkgdir/" --optimize=1
    install -m 644 -D ./LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
