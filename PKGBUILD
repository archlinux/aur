# Maintainer: Sigvald Marholm <marholm@marebakken.com>

pkgname=slepc4py
pkgver=3.11.0
pkgrel=1
_config=linux-c-opt
pkgdesc="Python bindings for SLEPc"
arch=('i686' 'x86_64')
url="https://bitbucket.org/slepc/slepc4py/src/master/"
license=('custom')
depends=('slepc' 'petsc' 'petsc4py' 'openmpi' 'python-numpy')
source=(https://bitbucket.org/slepc/slepc4py/downloads/${pkgname}-${pkgver}.tar.gz)
sha256sums=('9812d8b398fd6f30e872993421e420c64387c74fc3dab410208f13d7270257cf')

_slepc_dir=/opt/slepc/${_config}
_petsc_dir=/opt/petsc/${_config}
_petsc_arch="arch-linux-c-opt"

build() {

	export SLEPC_DIR=${_slepc_dir}
	export PETSC_DIR=${_petsc_dir}
	export PETSC_ARCH=${_petsc_arch}

	cd "${srcdir}"/${pkgname}-${pkgver}

	python setup.py build

}

package() {

	export SLEPC_DIR=${_slepc_dir}
	export PETSC_DIR=${_petsc_dir}
	export PETSC_ARCH=${_petsc_arch}

	cd "${srcdir}"/${pkgname}-${pkgver}

	python setup.py install --root="${pkgdir}"

}

# vim: shiftwidth=2 softtabstop=2 tabstop=2 noexpandtab
