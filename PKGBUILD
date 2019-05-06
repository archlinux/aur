# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
_modulename=mpi4py-intel
pkgname=python-$_modulename
pkgver=3.0.1
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
sha256sums=('770e8f0414addc88b36dd291fc28aaf2a2160d393f6f4b71a42511c51cbd63e7')

package() {
  cd "$srcdir/mpi4py-$pkgver"
  export MPICC=mpiicc
  python setup.py install --root="$pkgdir/" --optimize=1
}
