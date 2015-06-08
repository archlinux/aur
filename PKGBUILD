# Maintainer: Dobroslaw Kijowski [dobo] <dobo90_at_gmail.com>

pkgname=python2-ssdeep-git
_pkgname=python-ssdeep
pkgver=2.5.22.g46f74ec
pkgrel=1
pkgdesc='Python wrapper for ssdeep fuzzy hashing library'
arch=(any)
url=https://github.com/DinoTools/python-ssdeep
license=(GPL2)
depends=(python2)
makedepends=(cython2 python2-setuptools)
source=(git://github.com/DinoTools/python-ssdeep.git)
md5sums=(SKIP)

pkgver() {
  cd ${srcdir}/${_pkgname}
  git describe --always | sed 's/-/./g'
}

build() {
  cd ${srcdir}/${_pkgname}
  python2 setup.py build
}

package() {
  cd ${srcdir}/${_pkgname}
  python2 setup.py install --root=${pkgdir} --optimize=1
}
