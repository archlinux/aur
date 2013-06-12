# Maintainer: Benjamin Chretien <chretien at lirmm dot fr>
pkgname=py++-svn
pkgver=1856
pkgrel=2
pkgdesc="Py++ package and Boost.Python library provide a complete solution for interfacing Python and C++"
arch=('i686' 'x86_64')
url="http://www.language-binding.net/index.html"
depends=('pygccxml' 'python2')
makedepends=('subversion')
provides=('py++')
conflicts=('py++')
license=('custom')
md5sums=('SKIP')

_svnmod="pyplusplus"
source=("$_svnmod::svn://svn.code.sf.net/p/pygccxml/svn/pyplusplus_dev")

pkgver() {
  cd "$srcdir/$_svnmod"
  svnversion | tr -d [A-z]
}

build() {
  cd "$srcdir/$_svnmod"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_svnmod"
  python2 setup.py install --prefix=/usr --root=$pkgdir
}
