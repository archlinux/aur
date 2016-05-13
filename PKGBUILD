# Maintainer: Madotsuki <madotsuki@national.shitposting.agency>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Alexander Fehr <pizzapunk gmail com>
# Contributor: Brad Gordon <brad@rpgcyco.net>

pkgname=libmowgli
pkgver=2.1.0
pkgrel=1
pkgdesc='Performance and usability-oriented extensions to C'
url='http://atheme.org/projects/libmowgli.html'
license=('custom')
arch=('i686' 'x86_64')
depends=('openssl')
makedepends=('git')
source=("${pkgname}-${pkgver}::git+https://github.com/atheme/libmowgli-2.git")
sha1sums=('SKIP')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
	install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
