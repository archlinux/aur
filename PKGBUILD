pkgname=tvoeradio-desktop
pkgver=2.0
pkgrel=4
pkgdesc="Multiplatform client to listen music from VKontakte.ru and Last.fm services."
arch=('i686' 'x86_64')
url="http://tvoeradio.org/desktop/"
license=('GPL')
depends=('qt4' 'qtwebkit')
makedepends=('gcc' 'make' 'pkgconfig')
conflicts=('tvoeradio-desktop-svn')
provides=('tvoeradio-desktop')
replaces=('tvoeradio-desktop-svn')

source=(https://bitbucket.org/eXtractor/tvoeradio-desktop/downloads/${pkgname}-${pkgver}.tar.bz2)
sha1sums=('15574274b09ed8449e1a87c82821474ba8c7d123')

build() {
  cd $startdir/src/$pkgname-$pkgver/src

  qmake-qt4 || return 1

  make || return 1
  make INSTALL_ROOT="${pkgdir}" install || return 1

# Add freedesktop compatibility
#  install -D -m 664 $srcdir/$pkgname-$pkgver/src/img/tvoeradio-desktop.png $pkgdir/usr/share/pixmaps/tvoeradio-desktop.png || return 1
#  install -D -m 664 $srcdir/$pkgname-$pkgver/src/tvoeradio-desktop.desktop $pkgdir/usr/share/applications/tvoeradio-desktop.desktop || return 1
}
