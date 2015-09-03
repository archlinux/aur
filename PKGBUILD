# Maintainer: Yegorius <yegorius@domic.us>

pkgname=pulseaudio-dlna
pkgver=0.4.4
pkgrel=1
pkgdesc="A small DLNA server which brings DLNA/UPnP support to PulseAudio"
arch=('i686' 'x86_64')
url="https://github.com/masmu/pulseaudio-dlna"
license=('GPL3')
depends=('python2-dbus' 'python2-beautifulsoup3' 'python2-docopt'
		'python2-requests' 'python2-gobject2' 'python2-setproctitle'
		'python2-protobuf' 'python2-notify2' 'python2-psutil')
makedepends=('python2-setuptools')
optdepends=('lame: MP3 transcoding support'
			'faac: AAC transcoding support'
			'flac: FLAC transcoding support'
			'sox: WAV transcoding support'
			'opus-tools: OPUS transcoding support'
			'vorbis-tools: OGG transcoding support')
source=("$pkgname-$pkgver.tar.gz::https://github.com/masmu/pulseaudio-dlna/archive/$pkgver.tar.gz")
sha256sums=('5bb3357bbfd4f689c80f5e41d56bae54083e1b41c597f632b8469dc30cc474db')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --prefix="/usr" --root="$pkgdir" --optimize=1
}
