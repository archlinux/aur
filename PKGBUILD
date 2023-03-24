# Maintainer: Alex Forencich <alex@alexforencich.com>
pkgname=python-cocotbext-axi
pkgver=0.1.22
pkgrel=1
pkgdesc="AXI, AXI lite, and AXI stream modules for cocotb"
arch=('any')
url="https://github.com/alexforencich/cocotbext-axi"
license=('MIT')
depends=('python-cocotb' 'python-cocotb-bus')
makedepends=('python-setuptools')

source=("cocotbext-axi-$pkgver.tar.gz::https://github.com/alexforencich/cocotbext-axi/archive/v$pkgver.tar.gz")
sha256sums=('c0e444c780bb403b5a14928e5ca6c3c4d66625b8ab387593b9d068bd622bda58')

build() {
    cd "$srcdir/cocotbext-axi-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/cocotbext-axi-$pkgver"
    python setup.py install --skip-build --prefix=/usr --root="$pkgdir/" --optimize=1
    install -m 644 -D ./LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
