# Maintainer: Ivan Shapovalov <intelfx100@gmail.com>

pkgbase=python-unpaddedbase64
pkgname=($pkgbase python2-unpaddedbase64)
pkgver=1.0.1
pkgrel=1
pkgdesc='Unpadded Base64'
license=('Apache')
arch=('i686' 'x86_64')
url='https://pypi.python.org/pypi/unpaddedbase64/'
makedepends=('python-setuptools' 'python2-setuptools')
source=("${pkgbase}-${pkgver}.tar.gz::https://github.com/matrix-org/python-unpaddedbase64/archive/v${pkgver}.tar.gz")
md5sums=('598c04aad0efde06d3f0cfc5cef34263')

prepare() {
	cp -a "python-unpaddedbase64-${pkgver}"{,-python2}
}

build() {
	cd "$srcdir/python-unpaddedbase64-${pkgver}"
	python setup.py build

	cd "$srcdir/python-unpaddedbase64-${pkgver}-python2"
	python2 setup.py build
}

package_python-unpaddedbase64() {
	depends=('python')

	cd "python-unpaddedbase64-${pkgver}"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

package_python2-unpaddedbase64() {
	depends=('python2')

	cd "python-unpaddedbase64-${pkgver}-python2"
	python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim: set ts=4 sw=4 tw=0 ft=sh :
