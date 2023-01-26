# Maintainer: Alex Forencich <alex@alexforencich.com>
pkgname=python-cocotbext-axi
pkgver=0.1.20
pkgrel=1
pkgdesc="AXI, AXI lite, and AXI stream modules for cocotb"
arch=('any')
url="https://github.com/alexforencich/cocotbext-axi"
license=('MIT')
depends=('python-cocotb' 'python-cocotb-bus')
makedepends=('python-setuptools')

source=("cocotbext-axi-$pkgver.tar.gz::https://github.com/alexforencich/cocotbext-axi/archive/v$pkgver.tar.gz")
sha256sums=('363ec019f7f54e0dbf262306cac0c732bfd5e903eef97bf804de17092fa1229e')

build() {
    cd "$srcdir/cocotbext-axi-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/cocotbext-axi-$pkgver"
    python setup.py install --skip-build --prefix=/usr --root="$pkgdir/" --optimize=1
    install -m 644 -D ./LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
