# Maintainer: Sebastian LaVine <mail@smlavine.com>
# Contributor: lillian rose winter <hi@neko.vg>
# Contributor: Evan McCarthy <evan@mccarthy.mn>

pkgname=catgirl
pkgver=1.9a
pkgrel=2
pkgdesc='TLS-only terminal IRC client'
arch=('x86_64')
url="https://git.causal.agency/${pkgname}/"
license=('GPL3')
depends=('libretls' 'ncurses')
source=("https://git.causal.agency/${pkgname}/snapshot/${pkgname}-${pkgver}.tar.gz")
md5sums=('11d1050876fce2d69002de5dfb3e61c0')

build() {
	cd "${pkgname}-${pkgver}"
	./configure --prefix=/usr --mandir=/usr/share/man
	make all
}

package() {
	cd "${pkgname}-${pkgver}"
	make DESTDIR="$pkgdir/" install
}
