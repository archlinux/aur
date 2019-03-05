# Maintainer: Gary Hunt <garysERASE_THIS_PARTboxATgmailonedotcom>

pkgname=fargoal
pkgver=1
pkgrel=0
install=$pkgname.install
arch=('i686' 'x86_64')
pkgdesc="Sword of Fargoal remake by Elias Pschernig and Paul Pridham"
url="https://archive.org/details/fargoal"
license=("Freeware")
depends=(allegro4)
source=("https://archive.org/download/fargoal/fargoal.zip")
sha256sums=('SKIP')

# build function
build() {
	cd ..
#	patch -p0 < ./better-res-switching.patch
    	patch -p0 < ./trig.patch
	cd $srcdir/fargoal/src
	make 

}

# package function, cleanup
package() {
	
	mkdir -p $pkgdir/opt/fargoal
	cp $srcdir/fargoal/* $pkgdir/opt/fargoal/ -r
	rm $pkgdir/opt/fargoal/src -r
	rm $pkgdir/opt/fargoal/sword.exe
	mkdir -p $pkgdir/usr/bin/
	cp ../fargoal $pkgdir/usr/bin
}
