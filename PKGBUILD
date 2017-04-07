# Maintainer: Marco Asa <marcoasa90[at]gmail[dot]com>
# Contributor: Christopher Arndt <chris at chrisarndt.de>

pkgname=linux-show-player
pkgver=0.5
pkgrel=3
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
md5sums=('437509a570f8e1a3f5dbecbba2c205d0')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1
  install -Dm644 dist/linuxshowplayer.desktop "$pkgdir/usr/share/applications/linuxshowplayer.desktop"
  install -Dm644 dist/linuxshowplayer.png "$pkgdir/usr/share/pixmaps/linuxshowplayer.png"
  install -Dm644 dist/linuxshowplayer.xml "$pkgdir/usr/share/mime/packages/linuxshowplayer.xml"
}
