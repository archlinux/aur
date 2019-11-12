# Maintainer: BrainDamage <braindamage springlobby.info>

pkgname=raveloxmidi
pkgver=0.7.8
pkgrel=1
pkgdesc='raveloxmidi is a simple proxy to send and receive RTP midi data through network'
arch=('x86_64' 'armv7l' 'aarch64')
license=('GPL3')
url='https://github.com/ravelox/pimidi'
depends=('avahi')
makedepends=('automake' 'autoconf')
source=("https://github.com/ravelox/pimidi/archive/v${pkgver}.tar.gz")
sha256sums=('b13715e982ce280b8dea624ab80575e54d1cfee2068c229a6002bc78189fbd51')

build() {
	cd "${srcdir}/pimidi-${pkgver}/${pkgname}"
	./autogen.sh
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/pimidi-${pkgver}/${pkgname}"
	make DESTDIR="${pkgdir}" install
}
