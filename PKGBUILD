pkgname=python2-nupic-git
_pkgname=nupic
pkgver=2018_04_04
pkgrel=1
pkgdesc="Numenta Platform for Intelligent Computing is an implementation of Hierarchical Temporal Memory (HTM), a theory of intelligence based strictly on the neuroscience of the neocortex."
url="https://github.com/numenta/nupic"
arch=('x86_64' 'i686')
license=('AGPL')
depends=('python2-wheel' 'python2-pip' 'python2' 'python2-setuptools' 'python2-numpy')
makedepends=('git')
conflicts=('nupic')
source=("git+https://github.com/numenta/nupic.git")
md5sums=('SKIP')

pkgver() {
  cd ${srcdir}/${_pkgname}
  git log -1 --format="%cd" --date="format:%Y_%m_%d"
}

build() {
  cd ${srcdir}/${_pkgname}
  python2 setup.py build
}

package() {
  cd ${srcdir}/${_pkgname}
  python2 setup.py install --prefix="/usr" --root="${pkgdir}" -O1 --skip-build
}
