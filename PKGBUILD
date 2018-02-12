# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname='pmidi'
pkgdesc='Command line MIDI player using the ALSA sequencer'
url='http://www.parabola.me.uk/alsa/pmidi.html'
license=('GPL2')
pkgver='1.7.1'
pkgrel='1'
arch=('x86_64')
depends=('alsa-lib')
source=("${pkgname}-${pkgver}.tar.gz::https://sourceforge.net/projects/${pkgname}/files/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.gz/download")
sha512sums=('a0ceb6c95120ae86ce7919c7801d765a405de3d1199cc7c3fd3a7c127f0d57e7ef3f1aeed3e220fff9a3827be37b9fec67c5afa26cee1381ff9f53d139c7efda')

build () {
	cd "${pkgname}-${pkgver}"
	./configure --prefix=/usr --enable-silent-rules
	make
}

package () {
	cd "${pkgname}-${pkgver}"
	make install DESTDIR="${pkgdir}"
}
