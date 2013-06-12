pkgname=py++-svn
pkgver=1856
pkgrel=1
pkgdesc="Py++ package and Boost.Python library provide a complete solution for interfacing Python and C++"
arch=('i686' 'x86_64')
arch=('i686' 'x86_64')
url="http://www.language-binding.net/index.html"
depends=('pygccxml')
makedepends=('subversion')
provides=('py++')
conflicts=('py++')
license=('custom')

_svntrunk="http://pygccxml.svn.sourceforge.net/svnroot/pygccxml/pyplusplus_dev"
_svnmod="pyplusplus"

build() {
  cd "$srcdir"
  mkdir -p root
  msg "Connecting to pyplusplus SVN server......."
  svn co "$_svntrunk" "$_svnmod"
  msg "Starting make..."
  cd "$_svnmod"
  python2 setup.py install --prefix=../root/
}

package() {
  cp -r "$srcdir"/root/ "$pkgdir"/usr/
}