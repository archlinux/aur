# Maintainer: x@safe-mail.net where x stands for jbjunk
# Contributor: aggraef@gmail.com
pkgname=osc2midi
pkgver=0.1.04
pkgrel=1
pkgdesc="OSC2MIDI is a highly configurable OSC to jack MIDI (and back) bridge for linux (git version)"
arch=('x86_64' 'i686')
url="http://sourceforge.net/projects/osc2midi/"
license=('GPL')
depends=('jack' 'liblo')
makedepends=('cmake')
provides=('osc2midi')
conflicts=('osc2midi-git')
source=("http://download.sourceforge.net/project/$pkgname/${pkgname}_$pkgver.tar.bz2")
md5sums=('2f4efaa2575d7ddb88b44f9ac3f44dc5')

build() {
	cd "$srcdir/$pkgname"
	rm -rf build
	mkdir build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
	make
}

package() {
	cd "$srcdir/$pkgname"
	cd build
	make install DESTDIR="$pkgdir"
}
