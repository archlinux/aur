# Maintainer: Stephen Gregoratto <themanhimself@sgregoratto.me>

pkgname=adlmidi-git
pkgdesc="Commandline program that plays MIDI via software OPL3 emulation"
pkgrel=1
pkgver=1.2.6
arch=('i686' 'x86_64')
url="https://bisqwit.iki.fi/source/adlmidi.html"
license=('GPL3' 'GPL2+')
makedepends=('git')
optdepends=('ffmpeg: recording output to video file')
conflicts=(adlmidi)
source=("git://bisqwit.iki.fi/adlmidi.git")
sha256sums=('SKIP')

pkgver() {
	cd "${pkgname/-git}"
	git describe --long --tags origin/release | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
	cd "${pkgname/-git}"
	make 
}

package() {
	cd "${pkgname/-git}"
	install -D ./adlmidi "${pkgdir}"/usr/bin/adlmidi
}
