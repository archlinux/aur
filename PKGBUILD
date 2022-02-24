# Maintainer: Sebastian LaVine <mail@smlavine.com>
# Contributor: lillian rose winter <hi@neko.vg>
# Contributor: Evan McCarthy <evan@mccarthy.mn>

pkgname=catgirl
_pkgver=2.1
pkgver=2.1
pkgrel=1
pkgdesc='TLS-only terminal IRC client'
arch=('x86_64')
url="https://git.causal.agency/${pkgname}/"
license=('GPL3')
depends=('libretls' 'ncurses')
source=("https://git.causal.agency/${pkgname}/snapshot/${pkgname}-${_pkgver}.tar.gz")
md5sums=('75b381022a7ae9ac1e2fc19329ffcbe7')

build() {
	cd "${pkgname}-${_pkgver}"
	./configure --prefix=/usr --mandir=/usr/share/man
	make all
}

package() {
	cd "${pkgname}-${_pkgver}"
	make DESTDIR="$pkgdir/" install
}
