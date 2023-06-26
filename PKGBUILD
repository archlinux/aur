# Maintainer: Sigvald Marholm <marholm@marebakken.com>

pkgname=slepc4py
_pkgname=slepc
pkgver=3.19.1
pkgrel=1
pkgdesc="Python bindings for SLEPc"
arch=('i686' 'x86_64')
url="https://${_pkgname}.upv.es"
license=('custom')
depends=('slepc' 'petsc' 'openmpi' 'python-numpy')
source=(${url}/download/distrib/${_pkgname}-${pkgver/_/-}.tar.gz)
md5sums=('00c1fa02e573e3a2f43fecb9298a00a3')


build() {
	source /etc/profile.d/petsc.sh # gets PETSC_DIR
	source /etc/profile.d/slepc.sh # gets SLEPC_DIR

	cd ${srcdir}/${_pkgname}-${pkgver/_/-}/src/binding/${pkgname}
	python setup.py build

}

package() {
	source /etc/profile.d/petsc.sh # gets PETSC_DIR
	source /etc/profile.d/slepc.sh # gets SLEPC_DIR

	cd ${srcdir}/${_pkgname}-${pkgver/_/-}/src/binding/${pkgname}
	python setup.py install --root="${pkgdir}"

}
