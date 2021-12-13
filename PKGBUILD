# Maintainer: Xeonacid <h.dwwwwww at gmail dot com>

pkgname=python-itanium-demangler
_pkgname=itanium_demangler
pkgver=1.0
pkgrel=1
pkgdesc="Pure Python parser for mangled itanium symbols"
arch=('any')
url="https://github.com/whitequark/python-itanium_demangler"
license=('0BSD')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('bca0fae4cb0ad582a3c7ede97d66b325d13445fdf87c28947233d8559430967c')

build() {
	cd "$_pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
