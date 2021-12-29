# Maintainer: Alex Forencich <alex@alexforencich.com>
pkgname=python-cocotbext-axi
pkgver=0.1.18
pkgrel=1
pkgdesc="AXI, AXI lite, and AXI stream modules for cocotb"
arch=('any')
url="https://github.com/alexforencich/cocotbext-axi"
license=('MIT')
depends=('python-cocotb' 'python-cocotb-bus')
makedepends=('python-setuptools')

source=("cocotbext-axi-$pkgver.tar.gz::https://github.com/alexforencich/cocotbext-axi/archive/v$pkgver.tar.gz")
sha256sums=('37c27ff1f497d59447852efcb7b971289199c9737d353c484515cb36c5484f88')

build() {
    cd "$srcdir/cocotbext-axi-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/cocotbext-axi-$pkgver"
    python setup.py install --skip-build --prefix=/usr --root="$pkgdir/" --optimize=1
    install -m 644 -D ./LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
