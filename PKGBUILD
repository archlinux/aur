# Maintainer: Sigvald Marholm <marholm@marebakken.com>

pkgname=petsc4py
pkgver=3.11.0
pkgrel=1
_config=linux-c-opt
pkgdesc="Python bindings for PETSc"
arch=('i686' 'x86_64')
url="https://bitbucket.org/petsc/petsc4py/src/master"
license=(custom)
depends=(petsc openmpi python-numpy)
source=(https://bitbucket.org/petsc/petsc4py/downloads/${pkgname}-${pkgver}.tar.gz)
sha256sums=('58f4f57ac96ec39273906859cdc388b1ae372045c726bfd2a01d4eca8bc4a1e6')

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
