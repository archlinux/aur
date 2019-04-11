# Maintainer: Sigvald Marholm <marholm@marebakken.com>
# Based on python-ffc-git, maintained by Lucas H. Gabrielli <heitzmann@gmail.com>

_base=ffc
pkgname=python-${_base}
pkgdesc="A compiler for finite element variational forms (stable)."
pkgver=2018.1.0
pkgrel=2
arch=('any')
url="https://bitbucket.org/fenics-project/${_base}"
license=('LGPL3')
groups=('fenics')
conflicts=('python-ffc-git')
depends=('python-dijitso=2018.1.0'
         'python-fiat=2018.1.0'
				 'python-ufl=2018.1.0'
				 'pybind11')
options=(!emptydirs)
makedepends=('python-setuptools')
source=(${pkgname}-${pkgver}.tar.gz::https://bitbucket.org/fenics-project/${_base}/downloads/${_base}-${pkgver}.tar.gz)
sha256sums=('c5a6511693106d1cd2fc013148d0cd01cd1b99fc65dab461ca0b95851a9ea271')

build() {
	cd ${srcdir}/${_base}-${pkgver}
	python setup.py build
}

package() {
	cd ${srcdir}/${_base}-${pkgver}
	python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}

# vim: shiftwidth=2 softtabstop=2 tabstop=2 noexpandtab
