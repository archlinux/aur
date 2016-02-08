# Maintainer and Contributor: Vladimir Kamensky   <mastersoft24@yandex.ru>


pkgname=cloudcross
pkgver=v1.0.3
pkgrel=2
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


md5sums=("593f0a0e54f1f683f7f3d3e37487c20f")


build() {

	cd "$srcdir/cloudcross-$pkgver-$pkgrel"
	
	rm -rf build
	mkdir build
	cd build
	qmake .. 
	make   
}
 
package() {
	cd "$srcdir/cloudcross-$pkgver-$pkgrel/build"
	
	mkdir -p "${pkgdir}/usr/bin"
	
	cp "$srcdir/cloudcross-$pkgver-$pkgrel/build/ccross" "${pkgdir}/usr/bin"
	
	#ln -s "${pkgdir}/usr/bin/ccross" "${pkgdir}/usr/bin/CloudCross" 
	#ln -s "${pkgdir}/usr/bin/ccross" "${pkgdir}/usr/bin/grive2" 

}
