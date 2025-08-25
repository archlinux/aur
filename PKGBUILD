# Maintainer: Sebastian LaVine <mail@smlavine.com>
# Contributor: lillian rose winter <hi@neko.vg>
# Contributor: Evan McCarthy <evan@mccarthy.mn>

pkgname=catgirl
_pkgver=2.2a  # Bodge: pacman believes that 2.2a < 2.2
pkgver=2.2.a
pkgrel=2
pkgdesc='TLS-only terminal IRC client'
arch=('x86_64')
url="https://git.causal.agency/${pkgname}/"
license=('GPL3')
depends=('libretls' 'ncurses')
source=("https://git.causal.agency/${pkgname}/snapshot/${pkgname}-${_pkgver}.tar.gz")
sha256sums=('c6d760aaee134e052586def7a9103543f7281fde6531fbcb41086470794297c2')

build() {
	cd "${pkgname}-${_pkgver}"
	./configure --prefix=/usr --mandir=/usr/share/man
	make all
}

package() {
	cd "${pkgname}-${_pkgver}"
	make DESTDIR="$pkgdir/" install
}
