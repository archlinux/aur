# Maintainer and Contributor: Vladimir Kamensky  <mastersoft24@yandex.ru>


pkgname=cloudcross
pkgver=v1.0.3
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


source=("http://cloudcross.mastersoft24.ru/download/archive/?r=pacman")


md5sums=("cb5c210e4e733ea59ad19f20add0f457")


build() {

	cd "$srcdir/cloudcross-$pkgver-$pkgrel"
	
	rm -rf build
	mkdir build
	cd build
	qmake .. 
	make   
}
 
package() {
	cd "$srcdir/CloudCross-$pkgver-$pkgrel/build"
	
	mkdir -p "${pkgdir}/usr/bin"
	
	cp "$srcdir/CloudCross-$pkgver-$pkgrel/build/ccross" "${pkgdir}/usr/bin"
	
	#ln -s "${pkgdir}/usr/bin/ccross" "${pkgdir}/usr/bin/CloudCross" 
	#ln -s "${pkgdir}/usr/bin/ccross" "${pkgdir}/usr/bin/grive2" 

}
