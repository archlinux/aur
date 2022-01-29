# Maintainer: CupIvan <mail@cupivan.ru>
pkgname=xtrkcad
pkgver=5.2.2
pkgrel=1
pkgdesc="CAD program for designing model railroad layouts."
url="http://xtrkcad-fork.sourceforge.net"
arch=('x86_64')
license=('GPL2')

_srcname="xtrkcad-setup-${pkgver}GA-1.${arch}.sh"
source=("https://downloads.sourceforge.net/project/xtrkcad-fork/XTrackCad/Version%20${pkgver}/${_srcname}")
sha256sums=('209ff75779cffc8889b05524396bb822c7ae1c6474203414c8aa889518bdcf66')

build() {
	chmod 0777 "${_srcname}"
	mkdir usr
	./${_srcname} --skip-license --prefix="usr"
}

package() {
	cp -r "./usr" "${pkgdir}"
}
