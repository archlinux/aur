# Maintainer: Alex Forencich <alex@alexforencich.com>
pkgname=python-cocotbext-axi
pkgver=0.1.16
pkgrel=1
pkgdesc="AXI, AXI lite, and AXI stream modules for cocotb"
arch=('any')
url="https://github.com/alexforencich/cocotbext-axi"
license=('MIT')
depends=('python-cocotb' 'python-cocotb-bus')
makedepends=('python-setuptools')

source=("cocotbext-axi-$pkgver.tar.gz::https://github.com/alexforencich/cocotbext-axi/archive/v$pkgver.tar.gz")
sha256sums=('14df825700089082135da1f6dc0d7775f88cc57b8e171d95577ecf12da69dc0b')

build() {
    cd "$srcdir/cocotbext-axi-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/cocotbext-axi-$pkgver"
    python setup.py install --skip-build --prefix=/usr --root="$pkgdir/" --optimize=1
    install -m 644 -D ./LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
