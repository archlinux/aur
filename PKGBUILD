# Maintainer: Mirko Scholz <srtlg>
_pkgname=pyobjcryst
pkgname=python-${_pkgname}
pkgver=2.2.1
pkgrel=1
pkgdesc="Python bindings to ObjCryst++, the Object-Oriented Crystallographic Library."
url="https://www.diffpy.org/pyobjcryst/"
makedepends=('python-setuptools' 'boost')
depends=('python-numpy' 'boost-libs' 'libobjcryst')
license=('GPL2')
arch=('i686' 'x86_64')
source=(
"${_pkgname}-${pkgver}.tar.gz::https://github.com/diffpy/pyobjcryst/archive/v${pkgver}.tar.gz")
sha256sums=('3804259ebf29a0c4a593a7fb1c356bbaaa8455715affa297517abb92bf8d13e6')

build() {
	cd "$srcdir/${_pkgname}-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/${_pkgname}-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}
