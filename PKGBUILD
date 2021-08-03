# Maintainer: Tom Richards <tom@tomrichards.net>

pkgname=findaes
pkgver=1.2
pkgrel=1
pkgdesc="Find AES keys using key schedules"
arch=('x86_64')
url="https://sourceforge.net/projects/findaes/"
license=('public-domain')
source=("https://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.zip")
sha512sums=('1f999b0fe5b59308dbf07c6e4e23ceed410bc6fd745356b148d98cd9ea6c855a25ab20d1215df541a68f07b7dfbdca4f0e6314bfd519bdd7961c3a6e2ee17fb0')

prepare() {
	cd "${pkgname}-${pkgver}"
	sed -i 1,2d Makefile
}

build() {
	cd "${pkgname}-${pkgver}"
	make
}

package() {
	cd "${pkgname}-${pkgver}"
	install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
