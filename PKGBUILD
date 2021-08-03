# Maintainer: Alex Forencich <alex@alexforencich.com>
pkgname=python-cocotbext-pcie
pkgver=0.1.14
pkgrel=1
pkgdesc="PCI express simulation framework for cocotb"
arch=('any')
url="https://github.com/alexforencich/cocotbext-pcie"
license=('MIT')
depends=('python-cocotb' 'python-cocotbext-axi')
makedepends=('python-setuptools')

source=("cocotbext-pcie-$pkgver.tar.gz::https://github.com/alexforencich/cocotbext-pcie/archive/v$pkgver.tar.gz")
sha256sums=('98de9bdba8300b163539862f5a4c429c130b1d9bdae12bc967bf50c56948dc33')

build() {
    cd "$srcdir/cocotbext-pcie-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/cocotbext-pcie-$pkgver"
    python setup.py install --skip-build --prefix=/usr --root="$pkgdir/" --optimize=1
    install -m 644 -D ./LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
