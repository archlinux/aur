# Maintainer and Contributor: Vladimir Kamensky   <mastersoft24@yandex.ru>


pkgname=cloudcross
pkgver=1.4.2
pkgrel=4
pkgdesc="CloudCross is a improved multi-cloud client with OneDrive, Yandex disk, Google Drive, Dropbox and Mail.ru support."
arch=('i686' 'x86_64')
url="http://cloudcross.mastersoft24.ru"
license=('BSD')
categories=('network')
replaces=('grive2')



depends=( 'qt5-base' 'mesa' 'curl')
makedepends=( 'qt5-base' 'mesa' 'curl')
options=(!emptydirs)


source=("https://github.com/MasterSoft24/CloudCross/archive/master.tar.gz")
#source=("dev.tar.gz")


md5sums=("36792708f46eed21d82630b9eae70ea4")


build() {

	cd "$srcdir/CloudCross-master"
	#cd "$srcdir/CloudCross-dev"
	
	rm -rf build
	mkdir build
	cd build
	qmake .. 
	make   
}
 
package() {
	cd "$srcdir/CloudCross-master/build"
	#cd "$srcdir/CloudCross-dev/build"
	
	mkdir -p "${pkgdir}/usr/bin"
        mkdir -p "${pkgdir}/usr/share/man/man1"
	
	
	cp "$srcdir/CloudCross-master/build/ccross-app/ccross" "${pkgdir}/usr/bin"
	cp "$srcdir/CloudCross-master/build/ccross-curl-executor/ccross-curl" "${pkgdir}/usr/bin"
        cp "$srcdir/CloudCross-master/ccross-app/doc/ccross" "${pkgdir}/usr/share/man/man1"

}