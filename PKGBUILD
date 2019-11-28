# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=marshmallow-polyfield
pkgname=python-${_pkgname}
pkgver=5.7
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
sha256sums=('74f82e13adc002f0a1dbaa1fd7e2d0c5ca6f33791564e34a5ecb5eb736a9ef9a')

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
