# Maintainer: <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: dibblethewrecker <dibblethewrecker.at.jiwe.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=ico2xpm
pkgver=1.3
pkgrel=4
pkgdesc="A utility which converts Windows icons into X pixmaps"
arch=('x86_64' 'aarch64')
url="https://ico2xpm.sourceforge.net/"
license=('GPL')
source=(https://downloads.sourceforge.net/${pkgname}/${pkgver}/${pkgname}-${pkgver/./_}-src.tar.gz)
sha256sums=('598bea8344735dc174a1632a119315411a6d848a88250f1a20b46bbe251baa29')

build() {
	cd ${pkgname}-${pkgver}
	make
}

package() {
	cd ${pkgname}-${pkgver}
	install -Dm755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
}
