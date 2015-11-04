# Maintainer: Ivan Shapovalov <intelfx100@gmail.com>

pkgbase=python-matrix-angular-sdk
pkgname=('python2-matrix-angular-sdk')
pkgver=0.6.7
pkgrel=1
pkgdesc="AngularJS services for implementing the Client-Server API on Matrix"
license=('Apache')
arch=('any')
url="https://github.com/matrix-org/matrix-angular-sdk"
makedepends=('python2-setuptools')
source=("${pkgbase}-${pkgver}.tar.gz::https://github.com/matrix-org/matrix-angular-sdk/archive/v${pkgver}.tar.gz")
md5sums=('3dc5aaa49cf4fbbe672ab43182c7280c')

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
