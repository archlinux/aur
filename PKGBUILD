# Maintainer: Daniel Appelt <daniel.appelt@gmail.com>
_pkgbasename=openmusic
pkgname=${_pkgbasename}-bin
pkgver=6.16
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
sha256sums=("14214fcc6abf05383c2ec06bbe563e31d7ea079d94e9d3223d45a8ef8a96cc96")

package() {
	cd "$srcdir/OM_${pkgver}"
	make DESTDIR="${pkgdir}" PREFIX=/usr install
}
