# Maintainer: Marco Asa <marcoasa90[at]gmail[dot]com>
# Contributor: Christopher Arndt <chris at chrisarndt.de>

pkgname=linux-show-player
pkgver=0.5.1
pkgrel=1
pkgdesc="Sound cue playback software designed for live musical shows and theatre plays"
url="http://linux-show-player.sourceforge.net/"
arch=('any')
license=('GPL3')
depends=('python-pyqt5' 'python-gobject' 'gst-plugins-good' 'python-mido'
         'python-sortedcontainers' 'qt5-svg')
makedepends=('python-setuptools')
optdepends=('gst-libav: for larger format support'
            'portmidi: for portmidi support'
            'python-jack-client: for JACK output support')
options=('!emptydirs')
source=("https://github.com/FrancescoCeruti/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('d6c092c1b95c638b0d42367508b97b48')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1
  install -Dm644 dist/linuxshowplayer.desktop "$pkgdir/usr/share/applications/linuxshowplayer.desktop"
  install -Dm644 dist/linuxshowplayer.png "$pkgdir/usr/share/pixmaps/linuxshowplayer.png"
  install -Dm644 dist/linuxshowplayer.xml "$pkgdir/usr/share/mime/packages/linuxshowplayer.xml"
}
