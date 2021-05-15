# Maintainer: BrainDamage <braindamage springlobby.info>

pkgname=raveloxmidi
pkgver=0.10.3
pkgrel=1
pkgdesc='A simple proxy to send and receive RTP midi data through network'
arch=('x86_64' 'armv7l' 'aarch64')
license=('GPL3')
url='https://github.com/ravelox/pimidi'
depends=('avahi')
makedepends=('automake' 'autoconf')
source=("https://github.com/ravelox/pimidi/archive/v${pkgver}.tar.gz")
sha256sums=('7ba3c766f74ee8b15e9bcabc30af3587c5d990788a7574af7ff30e806bc17e01')

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
