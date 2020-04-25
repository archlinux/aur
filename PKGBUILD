# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
_modulename=mpi4py-intel
pkgname=python-$_modulename
pkgver=3.0.3
pkgrel=1
pkgdesc="Python bindings for the Message Passing Interface compiled with intel mpi"
arch=(any)
url="https://github.com/mpi4py/mpi4py"
license=('custom')
groups=()
depends=('intel-mpi')
makedepends=('python-setuptools')
provides=('python-mpi4py')
conflicts=('python-mpi4py')
replaces=()
backup=()
options=(!emptydirs)
install=
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('1df2c50e83174a965f55ee31782e5d84388a68c618c0a3c697a63247fe6409cb')
package() {
  cd "$srcdir/mpi4py-$pkgver"
  export MPICC=mpiicc
  python setup.py install --root="$pkgdir/" --optimize=1
}
