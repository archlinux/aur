# Maintainer: polyzen <polycitizen@gmail.com>

pkgname=vimb
pkgver=2.8
pkgrel=1
pkgdesc="The vim like browser"
arch=('i686' 'x86_64')
url="http://fanglingsu.github.io/vimb"
license=('GPL3')
depends=('libsoup' 'webkitgtk')
source=("${pkgname}-${pkgver}.tar.gz::https://codeload.github.com/fanglingsu/${pkgname}/tar.gz/${pkgver}")
sha256sums=('d398b0e772e1c3751ef76dc833e84b4abaa19f6b9b5e75afa63ace8b9ff12e12')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make GTK=3
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" PREFIX="/usr" install
}

# vim:set ts=2 sw=2 et:
