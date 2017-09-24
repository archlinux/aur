# Maintainer: Dominic Radermacher <blip@mockmoon-cybernetics.ch>
pkgname=mhwaveedit
pkgver=1.4.23
pkgrel=1
pkgdesc="mhWaveEdit is a graphical program for editing, playing and recording sound files."
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/magnush/mhwaveedit/"
license=('GPL')
makedepends=('autoconf')
depends=('gtk2' 'libsndfile' 'libsamplerate')
source=(https://web.archive.org/web/20170225142259/http://download.gna.org/mhwaveedit/mhwaveedit-1.4.23.tar.bz2)
sha256sums=('2352175b63092fda786ca26095b2f6ff6d257a6fcfb18401213a0c932b991904')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	./configure --prefix=/usr
	make
}
package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	make DESTDIR=${pkgdir} install
}