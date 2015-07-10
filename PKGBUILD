# Maintainer: Austin Haedicke <irc.freenode.net / github:  gtbjj>

# If you find errors or have suggestions please contact me
# via IRC PM or submit a pull request on github.

pkgname=cmus-git
pkgver=v2.7.0.r2.gc22b5bd
pkgrel=1
pkgdesc="A very feature-rich ncurses-based music player"
arch=('i686' 'x86_64')
url="https://cmus.github.io/"
depends=('ncurses')
makedepends=()
optdepends=('libpulse: PulseAudio'
		'alsa-lib: ALSA'
		'OSS: OSS'
		'libroar: RoarAudio'
		'libao: libao'
		'aRts: aRts'
		'libcdio: cdio plugin'
		'libcddb: cdio plugin'
		'libcue: .cue'
		'FLAC: .flac'
		'libvorbis: .ogg'
		'libmpcded: .mpc, .mpp, .mp+'
		'wavpack: .wv'
		'libmad: .mp3'
		'libavcodec: .wma, .ape, .mka, .tta, .shn'
		'FAAD: .aac, .mp4, .m4a, .m4b'
		'mp4v2: .mp4, .m4a, .m4b'
		'libmodplug: .mod, .s3m'
		'libmikmod: .mod, .s3m')
conflicts=('cmus')
provides=('cmus')
license=('GPL')
source=(git://github.com/cmus/cmus)
sha512sums=('SKIP')
_gitname=cmus

pkgver() {
  cd "$_gitname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_gitname"
  ./configure prefix=/usr
  make
}

package() {
  cd "$_gitname"
  make DESTDIR="$pkgdir" install
}
