# Maintainer: Sebastian LaVine <mail@smlavine.com>
# Contributor: lillian rose winter <hi@neko.vg>
# Contributor: Evan McCarthy <evan@mccarthy.mn>

pkgname=catgirl
_pkgver=2.0a  # pacman believes that 2.0a < 2.0. So we need this bodge for now
pkgver=2.0.a
pkgrel=2
pkgdesc='TLS-only terminal IRC client'
arch=('x86_64')
url="https://git.causal.agency/${pkgname}/"
license=('GPL3')
depends=('libretls' 'ncurses')
source=("https://git.causal.agency/${pkgname}/snapshot/${pkgname}-${_pkgver}.tar.gz")
md5sums=('58537d6a5ea0f9f2b1b3cddfff0ff2b6')

build() {
	cd "${pkgname}-${_pkgver}"
	./configure --prefix=/usr --mandir=/usr/share/man
	make all
}

package() {
	cd "${pkgname}-${_pkgver}"
	make DESTDIR="$pkgdir/" install
}
