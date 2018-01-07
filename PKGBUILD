# Maintainer: Stephen Gregoratto <s.gregoratto@gmail.com>

pkgname="adlmidi-git"
pkgdesc="Commandline program that plays MIDI via software OPL3 emulation"
pkgrel=1
pkgver=1.2.6
arch=('i686' 'x86_64')
url="https://bisqwit.iki.fi/source/adlmidi.html"
license=('GPL3' 'GPL2+')
makedepends=('git')
optdepends=('ffmpeg: recording output to video file')
provides=(adlmidi)
source=("git://bisqwit.iki.fi/adlmidi.git")
sha256sums=('SKIP')

pkgver() {
	curl -s $url | grep -Po -m1 'adlmidi-\K[^/"]+' | head -1 | sed 's/.tar.bz2//g'
}

build() {
	cd "${pkgname/-git}"
	make 
}

package() {
	cd "${pkgname/-git}"
	install -D ./adlmidi "${pkgdir}"/usr/bin/adlmidi
}
