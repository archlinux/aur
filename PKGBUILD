# Maintainer: Sam S. <smls75@gmail.com>

pkgname=mnemosyne-bzr
pkgver=2.3.3+r1886
_lastrelease=2.3.3
pkgrel=1
pkgdesc="A flash-card tool with a sophisticated card review algorithm (latest development snapshot)"
arch=('i686' 'x86_64')
url='http://www.mnemosyne-proj.org'
license=('GPL')
depends=('python2-pyqt' 'python2-matplotlib' 'python2-cherrypy' 'python2-webob')
makedepends=('bzr' 'python2-setuptools' 'python2-sphinx')
optdepends=('texlive-core: support for mathematical formulae in cards')
conflicts=('mnemosyne')
install='mnemosyne-bzr.install'

_bzrname=mnemosyne-proj
source="bzr+lp:$_bzrname"
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_bzrname"
  printf "$_lastrelease+r%s" "$(bzr revno)"
}

package() {
    cd "$srcdir"/$_bzrname/mnemosyne
    make DESTDIR="$pkgdir" install-system
}
