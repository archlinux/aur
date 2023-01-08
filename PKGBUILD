# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=libslink
pkgver=2.7.1
pkgrel=1
pkgdesc="A SeedLink client library written in C."
arch=("x86_64")
url="https://github.com/EarthScope/libslink"
license=('Apache-2.0')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('3f05a1345a1a36f0e40b14fc103ea6ea66f81cbdf5f7abd4ae11a026b7d58b9d')

build() {
	cd "${pkgname}-${pkgver}"
	make shared
}

package() {
	cd "${pkgname}-${pkgver}"
	make DESTDIR=${pkgdir} install
	install -D -t ${pkgdir}/usr/share/doc/${pkgname}/ -m 644 doc/UsersGuide-libslink
	install -D -t ${pkgdir}/usr/share/man/man3/ -m 644 doc/sl_*.3
}
# vim:set ts=4 sw=4 et:
