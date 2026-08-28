# Maintainer: Alex Forencich <alex@alexforencich.com>
pkgname=python-cocotbext-eth
pkgver=0.1.28
pkgrel=1
pkgdesc="Ethernet interface modules for cocotb"
arch=('any')
url="https://github.com/alexforencich/cocotbext-eth"
license=('MIT')
depends=('python-cocotb' 'python-cocotbext-axi')
makedepends=('python-setuptools')

source=("cocotbext-eth-$pkgver.tar.gz::https://github.com/alexforencich/cocotbext-eth/archive/v$pkgver.tar.gz")
sha256sums=('846e4f4cb5faf17ce3ee631966cb8882a831a6f1ce955ea8d8e4c91d75c74255')

build() {
    cd "$srcdir/cocotbext-eth-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/cocotbext-eth-$pkgver"
    python setup.py install --skip-build --prefix=/usr --root="$pkgdir/" --optimize=1
    install -m 644 -D ./LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
