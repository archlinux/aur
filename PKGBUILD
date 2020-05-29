# Maintainer: BrainDamage <braindamage springlobby.info>

pkgname=raveloxmidi
pkgver=0.9.1
pkgrel=1
pkgdesc='A simple proxy to send and receive RTP midi data through network'
arch=('x86_64' 'armv7l' 'aarch64')
license=('GPL3')
url='https://github.com/ravelox/pimidi'
depends=('avahi')
makedepends=('automake' 'autoconf')
source=("https://github.com/ravelox/pimidi/archive/v${pkgver}.tar.gz")
sha256sums=('07710b5fbad7c4628c95d0c27053a9b95741e06780d185476799708d402d6d8c')

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
