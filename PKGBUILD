# Contributor: Berseker < berseker86 at gmail.com >
pkgname=gphotoframe
pkgver=2.0.3
_realver=2.0-a3
pkgrel=1
pkgdesc="Gnome Photo Frame is a photo frame gadget for the GNOME Desktop."
arch=('i686' 'x86_64')
url="http://code.google.com/p/gphotoframe/"
license=('GPL3')
groups=()
depends=('pygtk' 'twisted' 'pyxdg' 'python2-gdata' 'python2-oauth')
makedepends=('python2-distutils-extra')
optdepends=('python2-simplejson' 'python2-feedparser' 'python2-clutter' 
'gnome-python-desktop')
provides=('gphotoframe')
conflicts=('gphotoframe-git')
options=()
source=(http://gphotoframe.googlecode.com/files/$pkgname-$_realver.tar.gz)

package() {
  cd "$srcdir/$pkgname-$_realver"
  python2 setup.py install --prefix=$pkgdir/usr/ || return 1
  gconf-merge-schema gphotoframe.schemas
}

md5sums=('7fde61994803182c1af93e6b4f4cb5b4')
