# Contributor: Dominic Radermacher <dominic.radermacher@gmail.com>
pkgname=mhwaveedit
pkgver=1.4.23
pkgrel=1
pkgdesc="mhWaveEdit is a graphical program for editing, playing and recording sound files."
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://gna.org/projects/mhwaveedit/"
license=('GPL')
depends=('gtk2' 'libsndfile' 'libsamplerate')
source=(http://download.gna.org/mhwaveedit/${pkgname}-${pkgver}.tar.bz2)
sha256sums=('2352175b63092fda786ca26095b2f6ff6d257a6fcfb18401213a0c932b991904')

build() {
	cd $srcdir/$pkgname-$pkgver
	./configure --prefix=/usr
	make
}
package() {
	cd $srcdir/$pkgname-$pkgver
	make DESTDIR=$pkgdir install
}
