# Contributor: N.Izumi - izmntuk
# Contributor: Dmitry Nosachev - quartz64 at gmail dot com

pkgname=smp_utils
pkgver=0.99
pkgrel=1
pkgdesc="Utilities for the Serial Attached SCSI (SAS) Management Protocol (SMP)"
arch=('i686' 'x86_64')
url="http://sg.danny.cz/sg/smp_utils.html"
license=('BSD')
depends=('glibc')
#options=('!libtool')
source=("http://sg.danny.cz/sg/p/${pkgname}-${pkgver}.tar.xz")
sha1sums=('bcc609f27223edc2592845a09ace70baa33c3784')

build() {
	cd "${pkgname}-${pkgver}"
	./configure --prefix=/usr --disable-static
	make
}

package() {
	cd "${pkgname}-${pkgver}"
	install -dm755 "${pkgdir}"/usr/share/{licenses,doc}/"${pkgname}"
	install -pm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}"
	install -pm644 AUTHORS ChangeLog COVERAGE CREDITS NEWS README "${pkgdir}/usr/share/doc/${pkgname}"
	make DESTDIR="${pkgdir}" install
}
