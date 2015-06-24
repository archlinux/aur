# Maintainer: Yegorius <yegorius@domic.us>

pkgname=pulseaudio-dlna
pkgver=0.3.5
pkgrel=2
pkgdesc="A small DLNA server which brings DLNA/UPnP support to PulseAudio"
arch=('i686' 'x86_64')
url="https://github.com/masmu/pulseaudio-dlna"
license=('GPL3')
depends=('python2-dbus' 'python2-beautifulsoup3' 'python2-docopt'
		 'python2-requests' 'python2-gobject2' 'python2-setproctitle')
makedepends=('python2-setuptools')
optdepends=('lame: MP3 transcoding support'
			'flac: FLAC transcoding support'
			'opus: OPUS transcoding support'
			'libogg: OGG transcoding support')
source=("$pkgname-$pkgver.tar.gz::https://github.com/masmu/pulseaudio-dlna/archive/$pkgver.tar.gz")
sha256sums=('e4405e15c6767c87f96623cf61701aae5fb3c0cdbf68e03dd5bb54ce536356d2')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --no-compile --prefix="/usr" --root="$pkgdir"
}
