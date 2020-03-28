# Maintainer: youngunix
# Submitter: goetzc


pkgname=smtube-qt4
pkgver=20.1.0
pkgrel=1
pkgdesc="Search, download and play videos from YouTube."
arch=('i686' 'x86_64')
url="http://smtube.sourceforge.net"
license=('GPL')
depends=('qtwebkit')
optdepends=('mplayer: play media with MPlayer'
            'smplayer: play media with SMPlayer'
            'gnome-mplayer: play media with GNOME MPlayer'
            'dragon: play media with Dragon Player'
            'totem: play media with Totem'
            'vlc: play media with VLC'
            'mpv: play media with mpv')
provides=('smtube')
conflicts=('smtube')
source=("https://sourceforge.net/projects/smtube/files/SMTube/$pkgver/smtube-$pkgver.tar.bz2")
md5sum=('skip')

build() {
  cd smtube-$pkgver
  make PREFIX=/usr QMAKE=qmake-qt4 LRELEASE=lrelease-qt4
}

package() {
  cd smtube-$pkgver
  make PREFIX=/usr DESTDIR="$pkgdir/" install
}
