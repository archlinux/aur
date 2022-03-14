# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>

pkgbase=python-matrix-synapse-ldap3
pkgname=(python-matrix-synapse-ldap3)
pkgver=0.2.0
pkgrel=1
pkgdesc='An LDAP3 auth provider for Synapse'
license=('Apache')
arch=('any')
url='https://github.com/matrix-org/matrix-synapse-ldap3'
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("${pkgbase}-${pkgver}.tar.gz::https://github.com/matrix-org/matrix-synapse-ldap3/archive/v${pkgver}.tar.gz")
sha256sums=('d5e70e91bcbb799cad7bef8e51c458959c68b1effd75585c89f175dc0721e3f3')

build() {
	cd "matrix-synapse-ldap3-${pkgver}"
	python -m build --wheel --no-isolation
}

package_python-matrix-synapse-ldap3() {
	depends=('python' 'python-twisted' 'python-ldap3' 'python-service-identity')
	replaces=('python2-matrix-synapse-ldap3')

	cd "matrix-synapse-ldap3-${pkgver}"
	python -m installer --destdir="${pgkdir}" dist/*.whl
}
