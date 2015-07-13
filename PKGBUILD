# Maintainer: x@safe-mail.net where x stands for jbjunk
# Contributor: aggraef@gmail.com
pkgname=osc2midi
pkgver=0.2.3
pkgrel=1
pkgdesc="OSC2MIDI is a highly configurable OSC to jack MIDI (and back) bridge for linux (git version)"
arch=('x86_64' 'i686')
url="https://github.com/ssj71/OSC2MIDI"
license=('GPL')
depends=('jack' 'liblo')
makedepends=('cmake')
provides=('osc2midi')
conflicts=('osc2midi-git')
source=("https://github.com/ssj71/OSC2MIDI/archive/v$pkgver.tar.gz")
md5sums=('824bfc9d594dab32575b0d71a7054518')

build() {
	cd "$srcdir/OSC2MIDI-$pkgver"
	rm -rf build
	mkdir build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
	make
}

package() {
	cd "$srcdir/OSC2MIDI-$pkgver"
	cd build
	make install DESTDIR="$pkgdir"
}
