# Maintainer: Daniel Appelt <daniel.appelt@gmail.com>
pkgname=openmusic
pkgver=6.12
pkgrel=1
pkgdesc="A visual programming language designed for music composition"
arch=('x86_64')
url="http://repmus.ircam.fr/openmusic/linux"
license=('GPL')
depends=('desktop-file-utils' 'gdk-pixbuf2' 'portmidi' 'libsndfile')
optdepends=('jack: JACK audio support'
	    'libsamplerate: speed up audio-waveform drawing')
# Note that the openmusic executable may not be compressed/stripped.
# (http://www.lispworks.com/kb/a15fc2ea99b4f8f5802571fe0057705a.html)
options=(!strip)
install="$pkgname.install"
source=("http://forge.ircam.fr/p/OM/downloads/get/OM_${pkgver}.tar.bz2")
sha256sums=('a3b593210805e1c6ce3f47cd137c9f7fb6d93c35edb7f398b0088f247b79db45')

package() {
	cd "$srcdir/OM_${pkgver}"
	make DESTDIR="${pkgdir}" PREFIX=/usr install
}
