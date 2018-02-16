# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
_modulename=mpi4py-intel
pkgname=python-$_modulename
pkgver=3.0.0
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
sha256sums=('77b05c836a414ca20083d6bb0e2d46c9b22940db73a822062ceb7517250b24ed')
package() {
  cd "$srcdir/mpi4py-$pkgver"
  export MPICC=mpiicc
  python setup.py install --root="$pkgdir/" --optimize=1
}
