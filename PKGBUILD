# Maintainer: Kyle Sferrazza <kyle.sferrazza@gmail.com>
# Contributor: fnord0 <fnord0@riseup.net>
# Contributor: N. Izumi aka izmntuk

pkgname=hanstunnel
pkgver=1.0
pkgrel=1
pkgdesc='IP over ICMP, Hans makes it possible to tunnel IPv4 through ICMP echo packets'
arch=('i686' 'x86_64')
url='http://code.gerade.org/hans/'
license=('GPL3')
depends=('gcc-libs')
source=("https://github.com/friedrich/hans/archive/v${pkgver}.tar.gz")
sha1sums=('8b5b5ad005afedf4a6bba5dd845c9ea40f2d6dd8')

build() {
	make -C "${srcdir}/hans-${pkgver}"
}

package() {
	cd "${srcdir}/hans-${pkgver}"
	install -d "${pkgdir}/usr/share/licenses/${pkgname}"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README"
	install -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"
	install -Dm644 CHANGES "${pkgdir}/usr/share/doc/${pkgname}/CHANGES"
	install -Dm755 hans "${pkgdir}/usr/bin/hans"
}
