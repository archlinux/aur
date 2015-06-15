pkgname=smtube-qt4
pkgver=15.5.17
pkgrel=1
pkgdesc="Search, download and play videos from YouTube."
arch=('i686' 'x86_64')
url="http://smtube.sourceforge.net"
license=('GPL')
depends=('qtwebkit')
optdepends=('mplayer: play media with MPlayer'
            'smplayer: play media with SMPlayer'
            'gnome-mplayer: play media with GNOME MPlayer'
            'kdemultimedia-dragonplayer: play media with Dragon Player'
            'totem: play media with Totem'
            'vlc: play media with VLC'
            'mpv: play media with mpv')
provides=('smtube')
conflicts=('smtube')
install="smtube.install"
source=("http://downloads.sourceforge.net/smtube/smtube-$pkgver.tar.bz2")
md5sums=('577ebdf5fbcd3d17959294e688c124b4')

build() {
  cd smtube-$pkgver
  make PREFIX=/usr QMAKE=qmake-qt4 LRELEASE=lrelease-qt4
}

package() {
  cd smtube-$pkgver
  make PREFIX=/usr DESTDIR="$pkgdir/" install
}
