# Maintainer: Stephen Gregoratto <s.gregoratto@gmail.com>

pkgname="adlmidi-git"
pkgdesc="OPL3 MIDI player for Linux and Windows"
pkgrel=1
pkgver=1.2.6
pkgdesc="A commandline program that plays MIDI via software OPL3 emulation"
arch=('i686' 'x86_64')
url="http://bisqwit.iki.fi/source/adlmidi.html"
license=('GPL3')
makedepends=('git')
optdepends=('ffmpeg: recording output to video file')
provides=(adlmidi)
source=("git://bisqwit.iki.fi/adlmidi.git")
sha256sums=('SKIP')

#pkgver() {
#	cd "${pkgname/-git}"
# 	printf "%s" "$(git describe --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
#}

build() {
	cd "${pkgname/-git}"
	make 
}

package() {
	cd "${pkgname/-git}"
	install -D ./adlmidi "${pkgdir}"/usr/bin/adlmidi
}
