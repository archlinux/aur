# Maintainer: Fabien Devaux <fdev31@gmail.com>
pkgname=aqualung
pkgver=1.0
pkgrel=3
epoch=
pkgdesc="High quality music player w/ gapless support"
arch=('i686' 'x86_64')
url="http://aqualung.jeremyevans.net/"
license=('GPL')
groups=()
depends=('gtk2' 'libxml2')
makedepends=('make')
checkdepends=()
optdepends=('liblrdf: LADSPA filters'
    'libcdio-paranoia: Audio CD playback'
    'libcddb: CDDB / FreeDB support'
    'libsamplerate: high quality Sample Rate Conversion'
    "libifp: iRiver's iFP support"
    "lua: Scripting support"
    "libsndfile: Uncompressed audio decode & WAV output"
    "flac: FLAC support (play & encode)"
    "libvorbis: Vorbis support (play & encode)"
    "liboggz: Oggz speex support (playback)"
    "speex: Oggz speex support (playback)"
    "libmad: MPEG audio support (playback)"
    "lame: MP3 audio support (encode)"
    "libmodplug: MOD files support (playback .mod .s3m .xm .it ...)"
    "libmpcdec: Musepack support (playback)"
    "wavpack: WavPpack support (playback)"
    "ffmpeg: generic A/V support"
    "sndio: outputs via sndio"
    "alsa-lib: outputs via ALSA"
    "jack: outputs via JACK"
    "libpulse: outputs via PulseAudio"
)
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://downloads.sourceforge.net/aqualung/${pkgname}-${pkgver}.tar.gz")
noextract=()
md5sums=("3fa6d580cf39726b8335031ca3420240")
validpgpkeys=()

prepare() {
	cd "$pkgname-$pkgver"
}

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr --without-mac
	make
}

check() {
	cd "$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
