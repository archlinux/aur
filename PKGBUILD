# Maintainer: Lucas H. Gabrielli <heitzmann@gmail.com>
pkgname=python2-meep
pkgver=1.4.2
pkgrel=1
pkgdesc="Python binding for MEEP (FDTD solver by MIT)"
url="https://launchpad.net/python-meep"
arch=('x86_64' 'i686')
license=('GPL')
depends=('python2' 'python2-numpy' 'python2-scipy' 'python2-matplotlib' 'meep' 'openmpi' 'swig')
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=("https://launchpad.net/python-meep/1.4/1.4/+download/python-meep-${pkgver}.tar")
md5sums=('f8913542d18b0dda92ebc64f0a10ce56')

build() {
  cd "${srcdir}/python-meep"
  tail -n +3 meep-site-init.py.standard > meep-site-init.py
  python2 setup-mpi.py clean --all 
  python2 setup-mpi.py build_ext
}

package() {
  cd "${srcdir}/python-meep"
  python2 setup-mpi.py install --prefix=/usr --root=${pkgdir}
}

# vim:set ts=2 sw=2 et:
