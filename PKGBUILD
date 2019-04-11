# Maintainer: Sigvald Marholm <marholm@marebakken.com>
# Based on python-dijitso-git, maintained by Lucas H. Gabrielli <heitzmann@gmail.com>

_base=dijitso
pkgname=python-${_base}
pkgdesc="A Python module for distributed just-in-time shared library building (stable)."
pkgver=2018.1.0
pkgrel=2
arch=('any')
url="https://bitbucket.org/fenics-project/${_base}"
license=('LGPL3')
groups=('fenics')
conflicts=('python-dijitso-git')
depends=('python-numpy')
optdepends=('mpi4py: for running tests with MPI')
makedepends=('python-setuptools')
options=(!emptydirs)
source=(${pkgname}-${pkgver}.tar.gz::https://bitbucket.org/fenics-project/${_base}/downloads/${_base}-${pkgver}.tar.gz)
sha256sums=('2084ada1e7bd6ecec0999b15a17db98c72e26f1ccbf3fcbe240b1a035a1a2e64')

build() {
	cd ${srcdir}/${_base}-${pkgver}
	python setup.py build
}

package() {
	cd ${srcdir}/${_base}-${pkgver}
	python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}

# vim: shiftwidth=2 softtabstop=2 tabstop=2 noexpandtab
