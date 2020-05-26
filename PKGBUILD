# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>

pkgbase=python-matrix-synapse-ldap3
pkgname=(python-matrix-synapse-ldap3)
pkgver=0.1.4
pkgrel=1
pkgdesc='An LDAP3 auth provider for Synapse'
license=('Apache')
arch=('any')
url='https://github.com/matrix-org/matrix-synapse-ldap3'
makedepends=('python-setuptools')
source=("${pkgbase}-${pkgver}.tar.gz::https://github.com/matrix-org/matrix-synapse-ldap3/archive/v${pkgver}.tar.gz")
sha256sums=('1fca60d3df719a6c1a01dd403260f41cf578444280b3314dc24466023aacbf39')

build() {
	cd "matrix-synapse-ldap3-${pkgver}"
	python setup.py build
}

package_python-matrix-synapse-ldap3() {
	depends=('python' 'python-twisted' 'python-ldap3' 'python-service-identity')

	cd "matrix-synapse-ldap3-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
