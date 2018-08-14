# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>

pkgbase=python-matrix-synapse-ldap3
pkgname=(python2-matrix-synapse-ldap3)
pkgver=0.1.3
pkgrel=1
pkgdesc='An LDAP3 auth provider for Synapse'
license=('Apache')
arch=('any')
url='https://github.com/matrix-org/matrix-synapse-ldap3'
makedepends=('python2-setuptools')
source=("${pkgbase}-${pkgver}.tar.gz::https://github.com/matrix-org/matrix-synapse-ldap3/archive/v${pkgver}.tar.gz")
sha256sums=('50d3b32cb21c92335bba637e435f926528473bdd6e52e10b05791657389082d0')

build() {
	cd "matrix-synapse-ldap3-${pkgver}"
	python2 setup.py build
}

package_python2-matrix-synapse-ldap3() {
	depends=('python2' 'python2-twisted' 'python2-ldap3' 'python2-service-identity')

	cd "matrix-synapse-ldap3-${pkgver}"
	python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
