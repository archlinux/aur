# Maintainer: Tim Hütz <tim@huetz.biz>
# Contributor: Tim Hütz <tim@huetz.biz>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Sebastien Binet <binet@cern.ch>

pkgname=python2-mpi4py
pkgver=1.3.1
pkgrel=2
pkgdesc="Python2 bindings of the Message Passing Interface (MPI)"
depends=('python' 'openmpi')
arch=('i686' 'x86_64')
url="http://mpi4py.scipy.org"
license=('BSD')
makedepends=('python2' 'python2-setuptools' 'openmpi')
source=("https://bitbucket.org/mpi4py/mpi4py/downloads/${pkgname//python2-/}-${pkgver}.tar.gz")
sha512sums=('15e81f2a1e6f6af7a54f0e8ec43ddf36cc565b7fe9e3dd35603c9d128199c5acd1584757ffca999c8826c0bbccf371175d40a7a24c85d3369efd77da5b3b603f')

build() {
  cd mpi4py-${pkgver}
  python2 setup.py build
}

package() {
  cd "mpi4py-${pkgver}"
  python2 setup.py install --root "${pkgdir}" --optimize=1 --skip-build
  
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}

