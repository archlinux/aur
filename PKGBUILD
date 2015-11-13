# Maintainer: Anthony Samartsev <kycok@archlinux.info>

pkgname=pymonopoly-git
pkgver=0.147.875b600
pkgrel=1
pkgdesc="Famous monopoly board game (russian variation - 'Manager'). In active development, so currently there's no ability to play"
arch=('any')
url="https://bitbucket.org/Kycok/pymonopoly-rewrite"
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
	mkdir -p $pkgdir/usr/lib/pymonopoly
	cp -r ${srcdir}/${pkgname}/{LIB,settings} ${pkgdir}/usr/lib/pymonopoly
	mv ${pkgdir}/usr/lib/pymonopoly/LIB/modules/Globals_linux.py ${pkgdir}/usr/lib/pymonopoly/LIB/modules/Globals.py
}
