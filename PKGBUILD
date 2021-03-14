# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=marshmallow-polyfield
pkgname=python-${_pkgname}
pkgver=5.10
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
sha256sums=('0644a823534c388a1f3907d82b619cfad734b894c894e3239c7314aaefff07f3')

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
