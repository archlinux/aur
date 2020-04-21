# Maintainer: Sigvald Marholm <marholm@marebakken.com>

pkgname=petsc4py
pkgver=3.13.0
pkgrel=1
_config=linux-c-opt
pkgdesc="Python bindings for PETSc"
arch=('i686' 'x86_64')
url="https://bitbucket.org/petsc/petsc4py/src/master"
license=(custom)
depends=(petsc openmpi python-numpy)
source=(https://bitbucket.org/petsc/petsc4py/downloads/${pkgname}-${pkgver}.tar.gz)
sha256sums=('ace21f71102e752fefac6c81b65207edba89a6974b3c58c71599c6c358640f39')

_petsc_dir=/opt/petsc/${_config}
_petsc_arch="arch-linux-c-opt"

build() {

	export PETSC_DIR=${_petsc_dir}
	export PETSC_ARCH=${_petsc_arch}

	cd ${srcdir}/${pkgname}-${pkgver}

	python setup.py build

}

package() {

	export PETSC_DIR=${_petsc_dir}
	export PETSC_ARCH=${_petsc_arch}

	cd ${srcdir}/${pkgname}-${pkgver}

	python setup.py install --root="${pkgdir}"

}

# vim: shiftwidth=2 softtabstop=2 tabstop=2 noexpandtab
