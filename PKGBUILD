# Contributor: Connor Behan <connor.behan@gmail.com>

pkgname=xorg-rendercheck
pkgver=1.4
pkgrel=2
pkgdesc="Suite of tests for the render extension"
url="http://xorg.freedesktop.org/"
license=('custom')
arch=('i686' 'x86_64')
depends=('libxrender')
makedepends=('renderproto')
source=($url/releases/individual/app/rendercheck-${pkgver}.tar.gz dst_color.diff)

build() {
	cd "${srcdir}/rendercheck-${pkgver}"
	patch -Np1 -i ../dst_color.diff
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/rendercheck-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
md5sums=('8ad09f646dc168ad3b50f8198f98b652' 'e13db45c31eda44e35280f0edd3857b6')
