# Maintainer: Sahin Kureta <kureta@kureta.xyz>
_pkgbasename=om7
pkgname=${_pkgbasename}-bin
pkgver=0.1.8
pkgrel=1
pkgdesc="A new implementation of the OpenMusic language and environment"
arch=("x86_64")
url="https://openmusic-project.github.io/om7/"
license=("GPL")
depends=("desktop-file-utils" "gdk-pixbuf2" "portmidi" "libsndfile")
optdepends=("jack: JACK audio support"
	    "libsamplerate: speed up audio-waveform drawing")
provides=("${_pkgbasename}")
conflicts=("${_pkgbasename}")
# Note that the openmusic executable may not be compressed/stripped.
# (http://www.lispworks.com/kb/a15fc2ea99b4f8f5802571fe0057705a.html)
options=(!strip)
source=("https://github.com/openmusic-project/om7/releases/download/v${pkgver}-Linux-alpha/om7_alpha.tar.bz2")
sha256sums=('36b20191c2bdf56f2778eb27dfad0194c0f094a6505182544b2630a3c19ccce1')

package() {
  cd om7
  mkdir -p "$pkgdir/usr/local/lib64/openmusic"
  make DESTDIR="$pkgdir/" install
}

