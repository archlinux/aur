pkgname=lib32-capstone
pkgver=3.0.4
pkgrel=1
pkgdesc="32bit capstone"
arch=('x86_64')
url='http://www.capstone-engine.org/index.html'
license=('BSD')
depends=('capstone')
source=(https://www.archlinux.org/packages/community/i686/capstone/download/#capstone-i686.pkg.tar.xz)
md5sums=('SKIP')
pkgver() {
        cat $srcdir/.PKGINFO | grep -oP '(?<=pkgver = )\d+\.\d+\.\d+'
}
package() {
	mkdir -p ${pkgdir}/usr/lib32
	cp -rPf ${srcdir}/usr/lib/*.so* ${pkgdir}/usr/lib32
}
