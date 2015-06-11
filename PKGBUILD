# Contributor: fnord0 < fnord0 AT riseup DOT net >
# Maintainer: N. Izumi aka izmntuk
pkgname=hanstunnel
pkgver=0.4.4
pkgrel=2
pkgdesc='IP over ICMP, Hans makes it possible to tunnel IPv4 through ICMP echo packets'
arch=('i686' 'x86_64')
url='http://code.gerade.org/hans/'
license=('GPL3')
source=("http://downloads.sourceforge.net/sourceforge/hanstunnel/hans-${pkgver}.tar.gz")
sha1sums=('8a21a9acc6d52cf7d2a5049523469e2609716ab3')

build() {
	make -C "${srcdir}/hans-${pkgver}"
}

package() {
	cd "${srcdir}/hans-${pkgver}"
	install -d "${pkgdir}/usr/share/licenses/${pkgname}"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README"
	install -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"
	install -Dm644 CHANGES "${pkgdir}/usr/share/doc/${pkgname}/CHANGES"
	install -Dm644 VERSION "${pkgdir}/usr/share/doc/${pkgname}/VERSION"
	install -Dm755 hans "${pkgdir}/usr/bin/hans"
	ln -srf "/usr/share/licenses/${pkgname}/LICENSE" "${pkgdir}/usr/share/${pkgname}/LICENSE"
}
