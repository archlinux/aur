# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=gmediafinder-git
pkgver=121.694694c
pkgrel=1
pkgdesc="Application to stream or download videos and music from various YouTube-like sites without having flash installed."
arch=('any')
url="http://gnomefiles.org/content/show.php/Gmediafinder?content=138588"
license=('GPL2')
depends=('gnome-icon-theme' 'gstreamer0.10-ffmpeg' 'gstreamer0.10-good-plugins' 'gstreamer0.10-python' 'libvisual-plugins' 'python2-beautifulsoup4' \
         'python2-configobj' 'python2-distutils-extra' 'python2-gdata' 'python2-html5lib' 'python2-lxml' 'python2-mechanize' 'pywebkitgtk')
makedepends=('git' 'python2-distribute')
install=gmediafinder.install
source=('git+https://github.com/smolleyes/gmediafinder2.git')
md5sums=('SKIP')

package() {
   cd $srcdir/gmediafinder2
   python2 setup.py install --root=$pkgdir --optimize=1
}

pkgver() {
  cd $srcdir/gmediafinder2

  echo $(git rev-list --count master).$(git rev-parse --short master)
}
