# Maintainer: Charles Bos <charlesbos1 AT gmail>
# Contributor: Szentandrasi Istvan <szentandrasii@gmail.com>

pkgname=etude-bzr
_bzrname=etude
pkgver=148
pkgrel=4
pkgdesc="xmms2 client written in pygtk"
arch=('i686' 'x86_64')
url="http://launchpad.net/etude"
license=('LGPL')
depends=('pygtk' 'pygoocanvas' 'python2-notify' 'python2-setuptools' 'pyxdg' 'xmms2' 'libvisual' 'libvisual-plugins' 'dbus-python' 'python2-gtkglext')
makedepends=('bzr' 'pyrex')
source=("$_bzrname::bzr+http://bazaar.launchpad.net/~szentandrasii/$_bzrname/default/")
md5sums=('SKIP')

pkgver() {
  cd $_bzrname
  bzr revno
}

package() {
  cd "$srcdir"/$_bzrname
  python2 setup.py install --root="$pkgdir" --enable-visual
}
