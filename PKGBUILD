# Contributor: Connor Behan <connor.behan@gmail.com>

pkgname=xorg-rendercheck
pkgver=1.5
pkgrel=2
pkgdesc="Suite of tests for the render extension"
url="http://xorg.freedesktop.org/"
license=('custom')
arch=('i686' 'x86_64')
depends=('libxrender')
makedepends=('xorgproto')
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

sha256sums=('1553fef61c30f2524b597c3758cc8d3f8dc1f52eb8137417fa0667b0adc8a604'
            '096f2e14ce37ac62f221779335f6867bf7ecd4ce4132c4e8a018e762a9cbc7cb')
