# Maintainer: Romain Beucher <romain@rbeucher.com>

pkgname=underworld2-git
pkgver=2.10
pkgrel=1
pkgdesc="Geodynamics modelling code"
arch=('x86_64')
url="http://underworldcode.org"
license=('GPL')
depends=('openmpi' 'hdf5-openmpi' 'petsc' 'python-matplotlib' 'python-numpy' 'python-mpi4py'
         'python-h5py-openmpi' 'swig' )
makedepends=('git' 'gcc-fortran' 'swig' 'scons' 'python-setuptools')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('underworld2::git+https://github.com/underworldcode/underworld2#branch=development')
noextract=()
md5sums=('SKIP')

build() {
    cd ${pkgname%-git}
    python setup.py build
}

package() {
    cd ${pkgname%-git}
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
