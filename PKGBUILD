# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=mkchromecast
pkgver=0.3.8
pkgrel=1
pkgdesc='Cast Audio/Video to your Google Cast and Sonos Devices'
arch=('any')
url=http://mkchromecast.com
license=('MIT')
depends=('faac' 'flac' 'gi' 'lame' 'python-flask' 'python-psutil'
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
sha512sums=('fa3c3924027c3008f61a4adc691643ff6051446c8bbc818faa863b60ceb61255da7f393df5250e75ac54cb61a892f02b7edc97bd50fd350dd4073e584fc25269')

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
