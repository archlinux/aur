# Maintainer: Alex Forencich <alex@alexforencich.com>
pkgname=python-cocotbext-pcie
pkgver=0.2.8
pkgrel=1
pkgdesc="PCI express simulation framework for cocotb"
arch=('any')
url="https://github.com/alexforencich/cocotbext-pcie"
license=('MIT')
depends=('python-cocotb' 'python-cocotbext-axi')
makedepends=('python-setuptools')

source=("cocotbext-pcie-$pkgver.tar.gz::https://github.com/alexforencich/cocotbext-pcie/archive/v$pkgver.tar.gz")
sha256sums=('963938f09e50b1d1332c1a7342545737b261cb742aaea8a721233ae4bdf7947b')

build() {
    cd "$srcdir/cocotbext-pcie-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/cocotbext-pcie-$pkgver"
    python setup.py install --skip-build --prefix=/usr --root="$pkgdir/" --optimize=1
    install -m 644 -D ./LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
