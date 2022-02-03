# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>

pkgbase=python-matrix-synapse-ldap3
pkgname=(python-matrix-synapse-ldap3)
pkgver=0.1.5
pkgrel=1
pkgdesc='An LDAP3 auth provider for Synapse'
license=('Apache')
arch=('any')
url='https://github.com/matrix-org/matrix-synapse-ldap3'
makedepends=('python-setuptools')
source=("${pkgbase}-${pkgver}.tar.gz::https://github.com/matrix-org/matrix-synapse-ldap3/archive/v${pkgver}.tar.gz")
sha256sums=('9e50e52eeba572bda73f30f2e7ebefba953a3cd8ebf69e0a89273f243b51b715')

build() {
	cd "matrix-synapse-ldap3-${pkgver}"
	python setup.py build
}

package_python-matrix-synapse-ldap3() {
	depends=('python' 'python-twisted' 'python-ldap3' 'python-service-identity')
	replaces=('python2-matrix-synapse-ldap3')

	cd "matrix-synapse-ldap3-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
