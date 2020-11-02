# Maintainer: Daniel Appelt <daniel.appelt@gmail.com>
_pkgbasename=openmusic
pkgname=${_pkgbasename}-bin
pkgver=6.17
pkgrel=1
pkgdesc="A visual programming language designed for music composition"
arch=("x86_64")
url="http://repmus.ircam.fr/openmusic/"
license=("GPL")
depends=("desktop-file-utils" "gdk-pixbuf2" "portmidi" "libsndfile")
optdepends=("jack: JACK audio support"
	    "libsamplerate: speed up audio-waveform drawing")
makedepends=("rsync")
provides=("${_pkgbasename}")
conflicts=("${_pkgbasename}")
# Note that the openmusic executable may not be compressed/stripped.
# (http://www.lispworks.com/kb/a15fc2ea99b4f8f5802571fe0057705a.html)
options=(!strip)
install="${_pkgbasename}.install"
source=("https://github.com/openmusic-project/OM6/releases/download/v${pkgver}/OM_${pkgver}.tar.bz2")
sha256sums=("4c8fe14208be28f2ef8ec846b5c651decb399d64adf8667dc2fbce9b348dd5ed")

package() {
	cd "$srcdir/OM_${pkgver}"
	make DESTDIR="${pkgdir}" PREFIX=/usr install
}
