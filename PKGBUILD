# Maintainer: Dominic Radermacher <dominic@familie-radermacher.ch>
pkgname=mhwaveedit
pkgver=1.4.24
pkgrel=2
pkgdesc="mhWaveEdit is a graphical program for editing, playing and recording sound files."
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/magnush/mhwaveedit/"
license=('GPL')
makedepends=('autoconf')
depends=('gtk2' 'libsndfile' 'libsamplerate')
source=("https://github.com/magnush/mhwaveedit/archive/v1.4.24.tar.gz")
sha256sums=('a4115b3d18f3f038b08b2bf4ff599703b7ba69bc7ac510d5f7279b3f47ea57dd')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	./configure --prefix=/usr
	make
}
package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	make DESTDIR=${pkgdir} install
}