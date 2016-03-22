# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>

pkgbase=python-matrix-angular-sdk
pkgname=('python2-matrix-angular-sdk')
pkgver=0.6.8
pkgrel=1
pkgdesc="AngularJS services for implementing the Client-Server API on Matrix"
license=('Apache')
arch=('any')
url="https://github.com/matrix-org/matrix-angular-sdk"
makedepends=('python2-setuptools')
source=("${pkgbase}-${pkgver}.tar.gz::https://github.com/matrix-org/matrix-angular-sdk/archive/v${pkgver}.tar.gz")
md5sums=('9cf2dd16d1fd34dc24c64a7efcdb2efd')

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
