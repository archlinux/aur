# Contributor: Connor Behan <connor.behan@gmail.com>

pkgname=xorg-rendercheck
pkgver=1.5
pkgrel=1
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

md5sums=('92ddef6d01f02529521af103f9b9bf60'
         'e317bac4cbb0a70d18f6951f661d55c0')
