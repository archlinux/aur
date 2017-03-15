# Maintainer and Contributor: Vladimir Kamensky   <mastersoft24@yandex.ru>


pkgname=cloudcross
pkgver=1.4.0
pkgrel=1
pkgdesc="CloudCross is a improved multi-cloud client with OneDrive, Yandex disk, Google Drive, Dropbox and Mail.ru support."
arch=('i686' 'x86_64')
url="http://cloudcross.mastersoft24.ru"
license=('BSD')
categories=('network')
replaces=('grive2')
#conflicts=('grive2')


depends=( 'qt5-base')
makedepends=( 'qt5-base')
options=(!emptydirs)


source=("http://cloudcross.mastersoft24.ru/download/archive/?r=pacman")


md5sums=("594a362a7d657414df2bae505853ace9")


build() {

	cd "$srcdir/cloudcross-v$pkgver-$pkgrel"
	
	rm -rf build
	mkdir build
	cd build
	qmake .. 
	make   
}
 
package() {
	cd "$srcdir/cloudcross-v$pkgver-$pkgrel/build"
	
	mkdir -p "${pkgdir}/usr/bin"
        mkdir -p "${pkgdir}/usr/share/man/man0"
	
	cp "$srcdir/cloudcross-v$pkgver-$pkgrel/build/ccross" "${pkgdir}/usr/bin"
        cp "$srcdir/cloudcross-v$pkgver-$pkgrel/doc/ccross" "${pkgdir}/usr/share/man/man0"
	
	#ln -s "${pkgdir}/usr/bin/ccross" "${pkgdir}/usr/bin/CloudCross" 
	#ln -s "${pkgdir}/usr/bin/ccross" "${pkgdir}/usr/bin/grive2" 

}
