# Maintainer and Contributor: Vladimir Kamensky   <mastersoft24@yandex.ru>


pkgname=cloudcross
pkgver=1.4.0
pkgrel=4
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


source=("https://github.com/MasterSoft24/CloudCross/archive/master.tar.gz")


md5sums=('4b9c1eff0a19fb7aa54bbb5e4ff329d3')


build() {

	cd "$srcdir/CloudCross-master"
	
	rm -rf build
	mkdir build
	cd build
	qmake .. 
	make   
}
 
package() {
	cd "$srcdir/CloudCross-master/build"
	
	mkdir -p "${pkgdir}/usr/bin"
        mkdir -p "${pkgdir}/usr/share/man/man0"
	
	cp "$srcdir/CloudCross-master/build/ccross" "${pkgdir}/usr/bin"
        cp "$srcdir/CloudCross-master/doc/ccross" "${pkgdir}/usr/share/man/man0"
	
	#ln -s "${pkgdir}/usr/bin/ccross" "${pkgdir}/usr/bin/CloudCross" 
	#ln -s "${pkgdir}/usr/bin/ccross" "${pkgdir}/usr/bin/grive2" 

}
