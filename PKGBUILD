# Maintainer: Francisco Salces Carcoba <pacosalces@gmail.com>
pkgname=python-physunits
_name=physunits
pkgver=0.0.6
pkgrel=3
pkgdesc="Physical units as global variables for simple numerical propagation"
license=("MIT")
url="https://pypi.org/project/physunits/"
makedepends=('python-setuptools')
depends=('python-numpy')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('4ef5513aaf9e4603fbf7483e226d96baf9e97a4a4c6347db2fc90e351d8839f0')
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
