# Maintainer: Mirko Scholz <srtlg>
_pkgname=pyobjcryst
pkgname=python-${_pkgname}
pkgver=2.2.4
pkgrel=1
pkgdesc="Python bindings to ObjCryst++, the Object-Oriented Crystallographic Library."
url="https://www.diffpy.org/pyobjcryst/"
makedepends=('python-setuptools' 'boost')
depends=('python-numpy' 'boost-libs' 'libobjcryst')
license=('GPL2')
arch=('i686' 'x86_64')
source=(
"${_pkgname}-${pkgver}.tar.gz::https://github.com/diffpy/pyobjcryst/archive/v${pkgver}.tar.gz")
sha256sums=('842764e944d9efb9d7494d44b49c74e3cd29bb40bb9535a06e6f730cae10c2dd')

build() {
	cd "$srcdir/${_pkgname}-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/${_pkgname}-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}
