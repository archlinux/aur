# Maintainer: Sigvald Marholm <marholm@marebakken.com>

pkgname=slepc4py
pkgver=3.12.0
pkgrel=1
_config=linux-c-opt
pkgdesc="Python bindings for SLEPc"
arch=('i686' 'x86_64')
url="https://gitlab.com/slepc/slepc4py"
license=('custom')
depends=('slepc' 'petsc' 'petsc4py' 'openmpi' 'python-numpy')
source=(https://gitlab.com/slepc/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('d8c06953b7d00f529a9a7fd016dfa8efdf1d05995baeea7688d1d59611f424f7')

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
