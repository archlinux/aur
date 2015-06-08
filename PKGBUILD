# Maintainer: ksj <podhorsky.ksj@gmail.com>
# Contributors: Ner0 Lari Tikkanen, oke3, Flamelab, WAntilles

pkgname=smplayer-qt5-svn
pkgver=6556
pkgrel=1
pkgdesc="A complete front-end for media players"
arch=('i686' 'x86_64')
url="http://smplayer.sourceforge.net/"
license=('GPL')
depends=('qt5-tools' 'qt5-base' 'qt5-script' )
makedepends=('subversion')
optdepends=('smtube-svn: For watching YouTube videos' 'mpv: Media player' 'mplayer: Media player')
provides=('smplayer')
conflicts=('smplayer')
install=smplayer.install
source=('smplayer::svn+https://subversion.assembla.com/svn/smplayer/smplayer/trunk/')
md5sums=('SKIP')

pkgver() {
  cd "$SRCDEST/smplayer"
  svnversion
}

build() {
  cd "$srcdir/smplayer"
  make PREFIX=/usr QMAKE=/usr/lib/qt/bin/qmake LRELEASE=/usr/lib/qt/bin/lrelease 
}

package() {
  cd "$srcdir/smplayer"
  make PREFIX="$pkgdir/usr" install
}
