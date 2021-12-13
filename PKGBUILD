# Maintainer: Xeonacid <h.dwwwwww at gmail dot com>

pkgname=python-pyvex
_pkgname="${pkgname#*-}"
pkgver=9.0.10730
pkgrel=1
pkgdesc="A Python interface to libVEX and VEX IR"
arch=('x86_64')
url="https://github.com/angr/pyvex"
license=('BSD')
depends=('python-pycparser' 'python-cffi' 'python-archinfo' 'python-bitstring' 'python-future')
makedepends=('python-setuptools' 'make' 'gcc')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('d9c5db74fa966ac1a55ee971cbacc62909377a7b78751c105911b32a3defe8db')

build() {
	cd "$_pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
