# Maintainer: Francisco Salces Carcoba <pacosalces@gmail.com>
pkgname=python-physunits
_name=physunits
pkgver=0.0.3
pkgrel=1
pkgdesc="Physical units as global variables for simple numerical propagation"
license=("MIT")
url="https://pypi.org/project/physunits/"
makedepends=('python-setuptools')
depends=('python-numpy')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('22e785c7cdf503004d3bb2309d45c466666e88a215afffd8bf3b0e7d5d307603')
arch=('any')

build() {
	cd "$srcdir"/${_name}-$pkgver
	python setup.py build
}

package() {
	cd "$srcdir"/${_name}-$pkgver
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build 
}
