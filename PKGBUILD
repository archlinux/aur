# Maintainer: Francisco Salces Carcoba <pacosalces@gmail.com>
pkgname=python-physunits
_name=physunits
pkgver=1.0.1
pkgrel=1
pkgdesc="Physical units as global variables for simple numerical propagation"
license=("MIT")
url="https://pypi.org/project/physunits/"
makedepends=('python-setuptools')
depends=('python-numpy')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('6ed307958ea47835a680a37ae0bb6fc00cf2cfaec1a972d28149d5a8841a9513')
arch=('any')

build() {
	cd "$srcdir"/${_name}-$pkgver
	python setup.py build
}

package() {
	cd "$srcdir"/${_name}-$pkgver
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build 
	install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
