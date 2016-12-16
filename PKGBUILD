# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>

pkgbase=python-matrix-synapse-ldap3
pkgname=(python2-matrix-synapse-ldap3)
pkgver=0.1.0.r5.g564eb3f
pkgrel=3
pkgdesc='An LDAP3 auth provider for Synapse'
license=('Apache')
arch=('any')
url='https://pypi.python.org/pypi/matrix-synapse-ldap3/'
makedepends=('python2-setuptools' 'git')
source=("git://github.com/matrix-org/matrix-synapse-ldap3#commit=564eb3f")
md5sums=('SKIP')

function pkgver() {
	cd matrix-synapse-ldap3
	git describe --long | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
	cd matrix-synapse-ldap3
	python2 setup.py build
}

package_python2-matrix-synapse-ldap3() {
	depends+=('python2' 'python2-twisted' 'python2-ldap3' 'python2-service-identity')

	cd matrix-synapse-ldap3
	python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim: set ts=4 sw=4 tw=0 ft=sh :
