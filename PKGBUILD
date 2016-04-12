# Maintainer: Yegorius <yegorius@domic.us>

pkgname=pulseaudio-dlna
pkgver=0.5.2
pkgrel=1
pkgdesc="A small DLNA server which brings DLNA/UPnP support to PulseAudio"
arch=('i686' 'x86_64')
url="https://github.com/masmu/pulseaudio-dlna"
license=('GPL3')
depends=('python2-pip' 'python2-dbus' 'python2-docopt'
		 'python2-requests' 'python2-setproctitle' 'python2-gobject2'
		 'python2-protobuf' 'python2-notify2' 'python2-psutil'
		 'python2-futures' 'python2-chardet' 'python2-netifaces'
		 'python2-lxml' 'python2-zeroconf')
makedepends=('python2-setuptools')
optdepends=('lame: MP3 transcoding support'
			'faac: AAC transcoding support'
			'flac: FLAC transcoding support'
			'sox: WAV transcoding support'
			'ffmpeg: multiple formats support'
			'opus-tools: OPUS transcoding support'
			'vorbis-tools: OGG transcoding support')
source=("$pkgname-$pkgver.tar.gz::https://github.com/masmu/pulseaudio-dlna/archive/$pkgver.tar.gz")
sha256sums=('e07f6db31502d90f6f8971d2cd1f96a540e2bd7f26f0090afdaee5b5c73f6a68')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
