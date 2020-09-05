# Contributor: d0lphin <scrouthtv [at] gmail [dot] com>
# Contributor: willemw <willemw12@gmail.com>
# Contributor: Andrew Trabo <v01d3r@gmail.com>

pkgname=peyote
pkgver=0.10.0
pkgrel=1
pkgdesc="Audio player with a Midnight Commander interface"
url="http://peyote.sourceforge.net/"
arch=('i686' 'x86_64')
license=('GPL3')
depends=( 'gst-python'  'python2-mutagen' 'pygtk' 'python2-dbus' 'python2-pyinotify' 'python2-pyalsaaudio')
#depends=('desktop-file-utils' 'gstreamer-python' 'gtk-update-icon-cache' 'mutagen' 'pygtk' 'python2-dbus' 'python2-pyinotify')
optdepends=('alsa-utils: default mixer (alsamixer)'
            'gstreamer0.10-bad-plugins: "Bad" plugin libraries'
            'geeqie: default image viewer'
            'gstreamer0.10-base-plugins: "Base" plugin libraries'
            'gstreamer0.10-ffmpeg: FFmpeg plugin'
            'gstreamer0.10-good-plugins: "Good" plugin libraries'
            'gstreamer0.10-ugly-plugins: "Ugly" plugin libraries'
            'libnotify: notifications (notify-send)'
            'mplayer: default video player'
            'rxvt-unicode: default terminal emulator for xpeyote')
install="$pkgname.install"
source=(http://downloads.sourceforge.net/project/peyote/Linux/${pkgname}_$pkgver.tar.gz)
sha256sums=('72acce6c394f57704a91d9621c5cecb766a3490be15d75b2ebcff3457af55497')

build() {
  cd ${pkgname}
  PYTHON=/usr/bin/python2 ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname}
  install -Dm644 README "$pkgdir/usr/share/$pkgname/README"
  make DESTDIR="$pkgdir/" install
}

