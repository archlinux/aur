# Maintainer: Alexander Praehauser <ahprae@protonmail.com>
_pkgbasename=om-sharp-bin
pkgname=${_pkgbasename}
pkgver=1.5
pkgrel=1
pkgdesc="Offshoot and inofficial successor to the OpenMusic composition software"
arch=("x86_64")
url="https://cac-t-u-s.github.io/"
license=("GPL3")
depends=("desktop-file-utils" "gdk-pixbuf2" "portmidi" "libsndfile")
optdepends=("jack: JACK audio support"
	    "libsamplerate: speed up audio-waveform drawing")
makedepends=("rsync")
provides=("${_pkgbasename}")
conflicts=("${_pkgbasename}")
# Note that the openmusic executable may not be compressed/stripped.
# (http://www.lispworks.com/kb/a15fc2ea99b4f8f5802571fe0057705a.html)
options=(!strip)
source=("https://github.com/cac-t-u-s/om-sharp/releases/download/v$pkgver/$_pkgbasename-$pkgver-1.deb")
sha256sums=('49de7fec06b8f3d44f0abff0275fea8c6906b6fa3f97d84eb01eb52414686165')


package() {
bsdtar --no-same-owner -s/lib64/lib/ -xvf data.tar.xz -C "$pkgdir"
}
