# Maintainer: Ivan Shapovalov <intelfx100@gmail.com>

pkgbase=python-matrix-angular-sdk
pkgname=('python2-matrix-angular-sdk')
pkgver=0.6.6
pkgrel=1
pkgdesc="AngularJS services for implementing the Client-Server API on Matrix"
license=('Apache')
arch=('any')
url="https://github.com/matrix-org/matrix-angular-sdk"
makedepends=('python2-setuptools')
source=("${pkgbase}-${pkgver}.tar.gz::https://github.com/matrix-org/matrix-angular-sdk/archive/v${pkgver}.tar.gz")
md5sums=('e806293c402f8cc925d8311f0efc6689')

build() {
	cd "matrix-angular-sdk-$pkgver"
	python2 setup.py build 
}

package_python2-matrix-angular-sdk() {
	depends=('python2')

	cd "matrix-angular-sdk-$pkgver"
	python2 setup.py install --root "${pkgdir}" --optimize=1 --skip-build
}

# vim: set ts=4 sw=4 tw=0 ft=sh :
