# Maintainer: Daniel Appelt <daniel.appelt@gmail.com>
pkgname=openmusic
pkgver=6.14
pkgrel=2
pkgdesc="A visual programming language designed for music composition"
arch=('x86_64')
url="http://repmus.ircam.fr/openmusic/"
license=('GPL')
depends=('desktop-file-utils' 'gdk-pixbuf2' 'portmidi' 'libsndfile')
optdepends=('jack: JACK audio support'
	    'libsamplerate: speed up audio-waveform drawing')
# Note that the openmusic executable may not be compressed/stripped.
# (http://www.lispworks.com/kb/a15fc2ea99b4f8f5802571fe0057705a.html)
options=(!strip)
install="$pkgname.install"
source=("http://forge.ircam.fr/p/OM/downloads/get/OM_${pkgver}.tar.bz2")
sha256sums=('74b438a9b5536208afac4530d54b0ebaef65d08da7360496cd3ad9c9169189bb')

package() {
	cd "$srcdir/OM_${pkgver}"
	make DESTDIR="${pkgdir}" PREFIX=/usr install
}
