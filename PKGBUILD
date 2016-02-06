# Maintainer and Contributor: Vladimir Kamensky  <mastersoft24@yandex.ru>


pkgname=cloudcross
pkgver=1.0.2
pkgrel=1
pkgdesc="CloudCross is a improved Google Drive sync client."
arch=('i686' 'x86_64')
url="http://cloudcross.mastersoft24.ru"
license=('GPL')
categories=('network')
replaces=('grive2')
#conflicts=('grive2')


depends=( 'qt5-base')
makedepends=( 'qt5-base')
options=(!emptydirs)


source=("http://cloudcross.mastersoft24.ru/download/?v=$pkgver&r=pacman")


md5sums=("9773ac37176ec3cf6f458d7898de2354")


build() {

	cd "$srcdir/CloudCross-$pkgver"
	
	rm -rf build
	mkdir build
	cd build
	qmake .. 
	make   
}
 
package() {
	cd "$srcdir/CloudCross-$pkgver/build"
	
	mkdir -p "${pkgdir}/usr/bin"
	
	cp "$srcdir/CloudCross-$pkgver/build/ccross" "${pkgdir}/usr/bin"
	
	#ln -s "${pkgdir}/usr/bin/ccross" "${pkgdir}/usr/bin/CloudCross" 
	#ln -s "${pkgdir}/usr/bin/ccross" "${pkgdir}/usr/bin/grive2" 

}
