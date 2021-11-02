# Maintainer: Francisco Salces Carcoba <pacosalces@gmail.com>
pkgname=python-physunits
_name=physunits
pkgver=1.0.2
pkgrel=1
pkgdesc="Physical units as global variables for simple numerical propagation"
license=("MIT")
url="https://pypi.org/project/physunits/"
makedepends=('python-setuptools')
depends=('python-numpy')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('c4c54fd2ce65ff4c950d626ca27131815af96d890b474a9267996c0f54b58a44')
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
