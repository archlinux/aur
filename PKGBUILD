# Contributor: Berseker < berseker86 at gmail.com >
pkgname=gphotoframe
pkgver=1.3
_realver=1.3
pkgrel=1
pkgdesc="Gnome Photo Frame is a photo frame gadget for the GNOME Desktop."
arch=('i686' 'x86_64')
url="http://code.google.com/p/gphotoframe/"
license=('GPL3')
groups=()
depends=('pygtk' 'twisted' 'pyxdg' 'python2-gdata')
makedepends=('python2-distutils-extra')
optdepends=('python-simplejson' 'python-feedparser' 'python-clutter' 
'gnome-python-desktop')
provides=('gphotoframe')
conflicts=('gphotoframe-git')
options=()
source=(http://gphotoframe.googlecode.com/files/$pkgname-$_realver.tar.gz)

build() {
  cd "$srcdir/$pkgname-$_realver"
  python2 setup.py install --prefix=$pkgdir/usr/ || return 1
  gconf-merge-schema gphotoframe.schemas
}

md5sums=('84742206179e00073d489cea16b225d6')
