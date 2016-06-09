# Maintainer: MAZ_1 <loveayawaka 'at' gmail 'dot' com>
# Contributor: thr <r at sledinmay dot com>
 
pkgname=lib32-glitz
pkgver=0.5.6
pkgrel=2
pkgdesc="OpenGL image compositing library"
arch=('x86_64')
url="http://cairographics.org/"
depends=('lib32-libgl' 'lib32-glibc' 'glitz')
license=('BSD')
source=(https://www.archlinux.org/packages/community/i686/glitz/download/#glitz-i686.pkg.tar.xz)
md5sums=('225f53b8ba19aed8e039a97f9aa6f0a5')
pkgver() {
        cat $srcdir/.PKGINFO | grep -oP '(?<=pkgver = )\d+\.\d+\.\d+'
}

package() {
	mkdir -p ${pkgdir}/usr/lib32/pkgconfig
	cp -rPf ${srcdir}/usr/lib/*.so* ${pkgdir}/usr/lib32
        cp -rPf ${srcdir}/usr/lib/pkgconfig/* ${pkgdir}/usr/lib32/pkgconfig/
}

