# Maintainer: Janne Heß <jannehess@gmail.com>

pkgname=dhcpdump
pkgver=1.8
pkgrel=1
pkgdesc='Parse DHCP packets'
arch=('x86_64' 'i686')
url='http://mavetju.org/unix/general.php'
license=('custom:dhcpdump')
depends=('libpcap')
source=("http://mavetju.org/download/dhcpdump-1.8.tar.gz")
sha512sums=('52cd63d581a3c530c2f5baa66808d5b0241853651c720bd513b769b8301b4dff9c87243787014aea98a5b3ebed86ec317b58d262bf5031015141a4da50fb76e6')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	make all
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	install -Dm755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 ${pkgname}.8 "${pkgdir}/usr/share/man/man8/${pkgname}.8" # FIXME
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"
}
