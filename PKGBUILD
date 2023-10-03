# Maintainer: <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Petar Benke <makepkg@benke.co.uk>

pkgname=cutmp3
pkgver=3.0.2
pkgrel=1
pkgdesc="Edit mp3 (and mp2) files without quality loss"
arch=('any')
url="https://www.puchalla-online.de/cutmp3.html"
license=('GPL')
depends=('readline')
source=("https://github.com/tarjanm-movidius/cutmp3/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9b949de184570698b00c001f8762f4c507b6b4e86fe9ac362ca6250bcd8f08d2')

build() {
	cd "${pkgname}-${pkgver}"
	CFLAGS=-Wno-error=format-security 
	make
}

package() {
	cd "${pkgname}-${pkgver}"
	make PREFIX="${pkgdir}/usr" install
}
