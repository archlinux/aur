pkgname=('python2-pyina-git')
pkgver=152.5d8ba73
pkgrel=1
pkgdesc="MPI parallel map and cluster scheduling from git master"
url="http://www.cacr.caltech.edu/~mmckerns/pyina.htm"
depends=('python2' 'python2-dill' 'python2-mpi4py' 'python2-pox' 'python2-pathos')
#optdepends=('python2-pyre')
makedepends=('python2-setuptools')
provides=('python2-pyina')
conflics=('python2-pyina')
license=('BSD')
arch=('any')

source=("git+https://github.com/uqfoundation/pyina#branch=master")
md5sums=('SKIP')

pkgver() {
  cd pyina
  #echo $(git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g')
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
    cd pyina
    python2 setup.py build
}

package() {
    cd pyina
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
