# Contributor: Lucas H. Gabrielli <heitzmann@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=python2-meep
pkgver=1.4.2
pkgrel=2
pkgdesc="Python binding for MEEP (FDTD solver by MIT)"
url="https://launchpad.net/python-meep"
arch=('x86_64' 'i686')
license=('GPL')
depends=('python2' 'python2-numpy' 'python2-scipy' 'python2-matplotlib' 'meep' 'openmpi' 'swig')
source=("https://launchpad.net/python-meep/1.4/1.4/+download/python-meep-${pkgver}.tar")
md5sums=('f8913542d18b0dda92ebc64f0a10ce56')

build() {
  cd python-meep
  tail -n +3 meep-site-init.py.standard > meep-site-init.py
  python2 setup-mpi.py clean --all 
  python2 setup-mpi.py build_ext
}

package() {
  cd python-meep
  python2 setup-mpi.py install --prefix=/usr --root=${pkgdir}
}
