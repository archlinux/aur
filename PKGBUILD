# Maintainer: Michael Straube <straubem@gmx.de>

pkgname=pogo
pkgver=0.8.7
pkgrel=3
pkgdesc='Plays your music. Nothing else.'
arch=('any')
url='https://github.com/jendrikseipp/pogo'
license=('GPL')
depends=('pygtk' 'gstreamer0.10-python' 'gstreamer0.10-base-plugins' 'mutagen'
         'python2-dbus' 'python2-pillow')
optdepends=('python2-notify: desktop notifications'
            'gnome-settings-daemon: GNOME media keys'
            'pulseaudio: PulseAudio support'
            'gstreamer0.10-good-plugins: PulseAudio support and good codecs'
            'gstreamer0.10-bad-plugins: additional codecs'
            'gstreamer0.10-ugly-plugins: additional codecs'
            'gstreamer0.10-ffmpeg: ffmpeg codec')
source=("https://github.com/jendrikseipp/pogo/archive/v$pkgver.tar.gz")
sha256sums=('144beebc043a834f17580ead90d30b64274d75dda524974d40754ee8344fc6f9')

prepare() {
  cd $pkgname-$pkgver

  sed -i 's/python/python2/' pogo.py
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir" install
}
