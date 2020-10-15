# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=marshmallow-polyfield
pkgname=python-${_pkgname}
pkgver=5.9
pkgrel=1
pkgdesc="An extension to marshmallow to allow for polymorphic fields"
arch=('x86_64')
url="https://github.com/Bachmann1234/marshmallow-polyfield"
license=('Apache')
depends=('python-coverage'
         'python-coveralls'
         'flake8'
         'python-marshmallow')
         #'python-pytest'
         #'python-pytest-cov'
         #'python-tox')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Bachmann1234/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('e2b84420b80647ec0d1452f93109367b7f3f4e23252cd979e40537bcfccb2c86')

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
