# Maintainer: Xeonacid <h.dwwwwww at gmail dot com>

pkgname=python-pyvex
_pkgname="${pkgname#*-}"
pkgver=9.1.12332
pkgrel=1
pkgdesc="A Python interface to libVEX and VEX IR"
arch=('x86_64')
url="https://github.com/angr/pyvex"
license=('BSD')
depends=('python-pycparser' 'python-cffi' 'python-archinfo' 'python-bitstring' 'python-future')
makedepends=('python-setuptools' 'make' 'gcc')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('7b596bb87829a50f2625b4f1eb1b140d290b0984084aa33d735bec8dd414e1e2')

build() {
	cd "$_pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
