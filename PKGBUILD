# Maintainer: Daniel Appelt <daniel.appelt@gmail.com>
_pkgbasename=openmusic
pkgname=${_pkgbasename}-bin
pkgver=6.15
pkgrel=1
pkgdesc="A visual programming language designed for music composition"
arch=("x86_64")
url="http://repmus.ircam.fr/openmusic/"
license=("GPL")
depends=("desktop-file-utils" "gdk-pixbuf2" "portmidi" "libsndfile")
optdepends=("jack: JACK audio support"
	    "libsamplerate: speed up audio-waveform drawing")
provides=("${_pkgbasename}")
conflicts=("${_pkgbasename}")
# Note that the openmusic executable may not be compressed/stripped.
# (http://www.lispworks.com/kb/a15fc2ea99b4f8f5802571fe0057705a.html)
options=(!strip)
install="${_pkgbasename}.install"
source=("https://github.com/openmusic-project/OM6/releases/download/v${pkgver}/OM-${pkgver}-Linux.tar.bz2")
sha256sums=("9eb7e072da8e89d20b62c396e371d51239b83737fd2a0168a74f808bda4e96b7")

package() {
	cd "$srcdir/OM_${pkgver}"
	make DESTDIR="${pkgdir}" PREFIX=/usr install
}
