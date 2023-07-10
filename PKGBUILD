# Maintainer: Sebastian LaVine <mail@smlavine.com>
# Contributor: lillian rose winter <hi@neko.vg>
# Contributor: Evan McCarthy <evan@mccarthy.mn>

pkgname=catgirl
pkgver=2.2
pkgrel=1
pkgdesc='TLS-only terminal IRC client'
arch=('x86_64')
url="https://git.causal.agency/${pkgname}/"
license=('GPL3')
depends=('libretls' 'ncurses')
source=("https://git.causal.agency/${pkgname}/snapshot/${pkgname}-${pkgver}.tar.gz")
md5sums=('0096d518e5958d62e5fe2a649a96b216')

build() {
	cd "${pkgname}-${pkgver}"
	./configure --prefix=/usr --mandir=/usr/share/man
	make all
}

package() {
	cd "${pkgname}-${pkgver}"
	make DESTDIR="$pkgdir/" install
}
