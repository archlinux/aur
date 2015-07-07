# Maintainer: Ivan Shapovalov <intelfx100@gmail.com>

pkgbase=python-syutil-git
pkgname=('python2-syutil-git')
pkgver=0.0.5.r0.ga65b4a2
pkgrel=1
pkgdesc="An utility library common to synapse and sydent"
license=('Apache')
arch=('any')
url="https://github.com/matrix-org/syutil"
makedepends=('python2-mock' 'python2-setuptools_trial' 'git')
source=("git://github.com/matrix-org/syutil.git")
md5sums=('SKIP')

pkgver() {
	cd syutil
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd syutil
	python2 setup.py build 
}

package_python2-syutil-git() {
	depends=('python2' 'python2-pyasn1' 'python2-pynacl' 'python2-simplejson' 'python2-frozendict')
	provides=('python2-syutil')
	conflicts=('python2-syutil')

	cd syutil
	python2 setup.py install --root "${pkgdir}" --optimize=1 --skip-build
}

# vim: set ts=4 sw=4 tw=0 ft=sh :
