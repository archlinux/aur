# Maintainer: Ivan Shapovalov <intelfx100@gmail.com>

pkgbase=python-syutil
pkgname=('python2-syutil')
pkgver=0.0.7
pkgrel=1
pkgdesc="An utility library common to synapse and sydent"
license=('Apache')
arch=('any')
url="https://github.com/matrix-org/syutil"
makedepends=('python2-mock' 'python2-setuptools_trial')
source=("${pkgbase}-${pkgver}.tar.gz::https://github.com/matrix-org/syutil/archive/v${pkgver}.tar.gz")
md5sums=('ef5d3a762141cab7415d06fbd0eff0a4')

build() {
	cd "syutil-$pkgver"
	python2 setup.py build 
}

package_python2-syutil() {
	depends=('python2' 'python2-pyasn1' 'python2-pynacl' 'python2-simplejson' 'python2-frozendict')

	cd "syutil-$pkgver"
	python2 setup.py install --root "${pkgdir}" --optimize=1 --skip-build
}

# vim: set ts=4 sw=4 tw=0 ft=sh :
