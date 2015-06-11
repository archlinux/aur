# Contributor: antoniogmc <AT> gmail <DOT> com

pkgname=python2-svnplot
_pkgname=SVNPlot
pkgver=0.8.6
pkgrel=1
pkgdesc="SVNPlot generates graphs similar to StatSVN"
arch=('any')
url="https://bitbucket.org/nitinbhide/svnplot/wiki/Home"
license=('BSD')
depends=('python2-numpy' 'python2-matplotlib' 'python2-pysvn')
makedepends=('dos2unix')
source=(https://bitbucket.org/nitinbhide/svnplot/downloads/${_pkgname}-${pkgver}.zip python2.patch)
md5sums=('6c0118bad51dc8072bc4641e84b3af6d'
         '42335334fe6ad000587be8768124ed45')

package() {
  cd "$srcdir"/$_pkgname-${pkgver}

  patch -Np1 -i $srcdir/python2.patch

  dos2unix *.py

  python2 setup.py install --root "$pkgdir"
}

# vim:set ts=2 sw=2 et:
