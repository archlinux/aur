# Maintainer: Anthony Samartsev <kycok@archlinux.info>

pkgname=pymonopoly-git
pkgver=0.249.c148629
pkgrel=1
pkgdesc="Famous monopoly board game (russian variation - 'Manager'). In active development"
arch=('any')
url="https://github.com/Kycko/PyMonopoly"
license=('GPL3')
depends=('python2-pygame')
makedepends=('git')
source=(${pkgname}::git+"${url}.git")
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"
	echo "0.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
	true
}

package() {
	mkdir -p $pkgdir/usr/bin
	cp ${srcdir}/${pkgname}/pymonopoly_linux.py ${pkgdir}/usr/bin/pymonopoly
	mkdir ${pkgdir}/usr/lib
	cp -r ${srcdir}/${pkgname}/LIB/ ${pkgdir}/usr/lib/pymonopoly/
	mv ${pkgdir}/usr/lib/pymonopoly/modules/Globals_linux.py ${pkgdir}/usr/lib/pymonopoly/modules/Globals.py
}
