# Maintainer: Ivan Shapovalov <intelfx100@gmail.com>

pkgbase=python-matrix-angular-sdk-git
pkgname=('python2-matrix-angular-sdk-git')
pkgver=0.6.6.r2.g1fc0444
pkgrel=1
pkgdesc="AngularJS services for implementing the Client-Server API on Matrix"
license=('Apache')
arch=('any')
url="https://github.com/matrix-org/matrix-angular-sdk"
makedepends=('python2-setuptools' 'git')
source=("git://github.com/matrix-org/matrix-angular-sdk.git#branch=develop")
md5sums=('SKIP')

pkgver() {
	cd matrix-angular-sdk
	git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd matrix-angular-sdk
	python2 setup.py build 
}

package_python2-matrix-angular-sdk-git() {
	depends=('python2')
	provides=('python2-matrix-angular-sdk')
	conflicts=('python2-matrix-angular-sdk')

	cd matrix-angular-sdk
	python2 setup.py install --root "${pkgdir}" --optimize=1 --skip-build
}

# vim: set ts=4 sw=4 tw=0 ft=sh :
