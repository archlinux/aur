# Maintainer: Cedric Girard <girard.cedric@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Asa Marco <marcoasa90[at]gmail[.]com>

pkgname=openshot-bzr
pkgver=741
pkgrel=1
pkgdesc="an open-source, non-linear video editor for Linux based on MLT framework"
arch=('any')
url="http://www.openshotvideo.com/"
license=('GPL')
conflicts=(openshot)
depends=('mlt-python-bindings' 'pygoocanvas' 'sdl' 'librsvg' 'mplayer'
	 'pyxdg' 'pygtk' 'python2-httplib2' 'python-imaging')
makedepends=('bzr')
optdepends=('dvgrab: for IEEE digital sources'
	    'libquicktime' 'libavc1394' 'faac' 'jack' 'jack-rack' 'ladspa')
install=openshot.install
source=(bzr+lp:openshot)
md5sums=('SKIP')

pkgver() {
    cd openshot
    bzr revno
}

package() {
  cd $srcdir/openshot
  python2 setup.py install --root=$pkgdir/ --optimize=1
}
