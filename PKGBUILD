# Maintainer: CupIvan <mail@cupivan.ru>
pkgname=xtrkcad
pkgver=5.3.0
pkgrel=1
pkgdesc="CAD program for designing model railroad layouts."
url="http://xtrkcad-fork.sourceforge.net"
arch=('x86_64')
license=('GPL2')

_srcname="xtrkcad-setup-${pkgver}GA-1.${arch}.sh"
source=("https://downloads.sourceforge.net/project/xtrkcad-fork/XTrackCad/Version%20${pkgver}/${_srcname}")
sha256sums=('938291eaa2dca75cd763092cef4b8c5557d22ba909b931b975d5fd1305769646')

build() {
	chmod 0777 "${_srcname}"
	mkdir usr
	./${_srcname} --skip-license --prefix="usr"
}

package() {
	cp -r "./usr" "${pkgdir}"
}
