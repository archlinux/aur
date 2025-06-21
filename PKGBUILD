# Maintainer: CupIvan <mail@cupivan.ru>
pkgname=xtrkcad
pkgver=5.3.1
pkgrel=1
pkgdesc="CAD program for designing model railroad layouts."
url="http://xtrkcad-fork.sourceforge.net"
arch=('x86_64')
license=('GPL2')

_postfix="Beta1-1"
_srcname="xtrkcad-setup-${pkgver}${_postfix}.${arch}.sh"
source=("https://downloads.sourceforge.net/project/xtrkcad-fork/XTrackCad/Version%20${pkgver}%20Beta1/xtrkcad-setup-${pkgver}Beta1-1.${arch}.sh")
md5sums=('c535d5a638d33291b4c7d317e566f2b5')

build() {
	chmod 0777 "${_srcname}"
	mkdir usr
	./${_srcname} --skip-license --prefix="usr"
}

package() {
	cp -r "./usr" "${pkgdir}"
	cd ${pkgdir}/usr/
	mv ./bin/xtrkcad-beta ./bin/xtrkcad
	mv ./share/xtrkcad-beta ./share/xtrkcad
}
