# Maintainer: Sigvald Marholm <marholm@marebakken.com>

pkgname=petsc4py
pkgver=3.14
pkgrel=1
_config=linux-c-opt
pkgdesc="Python bindings for PETSc"
arch=('i686' 'x86_64')
url="https://bitbucket.org/petsc/petsc4py/src/master"
license=(custom)
depends=(petsc openmpi python-numpy)
source=(https://gitlab.com/petsc/petsc/-/archive/v${pkgver}/petsc-v${pkgver}.tar.gz)
sha256sums=('9297fcd91620f52235cb6fb44244ed217ea8b01b2ff6a5172ffe15bb0a0d7b55')

_petsc_dir=/opt/petsc/${_config}
_petsc_arch="arch-linux-c-opt"

build() {

	export PETSC_DIR=${_petsc_dir}
	export PETSC_ARCH=${_petsc_arch}

	cd ${srcdir}/petsc-v${pkgver}/src/binding/${pkgname}

	python setup.py build

}

package() {

	export PETSC_DIR=${_petsc_dir}
	export PETSC_ARCH=${_petsc_arch}

	cd ${srcdir}/petsc-v${pkgver}/src/binding/${pkgname}

	python setup.py install --root="${pkgdir}"

}

# vim: shiftwidth=2 softtabstop=2 tabstop=2 noexpandtab
