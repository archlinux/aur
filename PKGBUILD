# Maintainer: Alex Forencich <alex@alexforencich.com>
pkgname=python-cocotbext-pcie
pkgver=0.1.16
pkgrel=1
pkgdesc="PCI express simulation framework for cocotb"
arch=('any')
url="https://github.com/alexforencich/cocotbext-pcie"
license=('MIT')
depends=('python-cocotb' 'python-cocotbext-axi')
makedepends=('python-setuptools')

source=("cocotbext-pcie-$pkgver.tar.gz::https://github.com/alexforencich/cocotbext-pcie/archive/v$pkgver.tar.gz")
sha256sums=('5618906d9dc6ee3c0f2ae1357ded06c194c56293d1130fc426670541e154ba8c')

build() {
    cd "$srcdir/cocotbext-pcie-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/cocotbext-pcie-$pkgver"
    python setup.py install --skip-build --prefix=/usr --root="$pkgdir/" --optimize=1
    install -m 644 -D ./LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
