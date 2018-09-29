# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=mkchromecast
pkgver=0.3.8.1
pkgrel=1
pkgdesc='Cast Audio/Video to your Google Cast and Sonos Devices'
arch=('any')
url=http://mkchromecast.com
license=('MIT')
depends=('faac' 'flac' 'lame' 'python-flask' 'python-gobject' 'python-psutil'
         'python-pychromecast' 'sox' 'vorbis-tools')
makedepends=('python-setuptools')
optdepends=('alsa-utils: to cast with ALSA'
            'ffmpeg: for ffmpeg backend and/or to cast with ALSA'
            'gstreamer: for gstreamer backend'
            'nodejs: for node backend'
            'pavucontrol: to cast with PulseAudio'
            'pulseaudio: to cast with PulseAudio'
            'python-pyqt5: system tray menu support'
            'python-soco: Sonos support'
            'youtube-dl: YouTube support')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/muammar/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('ee66450768f3221500f198bf618120f02b93108797209ca0d6c2be9f882eee36753d3e1038354e51b5d76d130c12d193c7d152b33f80776cb225347a3743f376')

package() {
  cd $pkgname-$pkgver
  install -d "$pkgdir"/usr/bin
  ln -s /usr/share/$pkgname/$pkgname.py "$pkgdir"/usr/bin/$pkgname

  install -Dm755 $pkgname.py "$pkgdir"/usr/share/$pkgname/$pkgname.py
  cp -a --parents images/google* $pkgname nodejs "$pkgdir"/usr/share/$pkgname

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
  install -Dm644 images/$pkgname.xpm "$pkgdir"/usr/share/pixmaps/$pkgname.xpm
  install -Dm644 man/$pkgname.1 "$pkgdir"/usr/share/man/man1/$pkgname.1
}

# vim:set ts=2 sw=2 et:
