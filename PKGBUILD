# Maintainer: jrdemasi <jrdemasi@gmail.com>
validpgpkeys=('EFD9413B17293AFDFE6EA6F1402A088DEDF104CB')
pkgname=cryptcat
pkgver=1.2.1
pkgrel=4
pkgdesc="Cryptcat is the standard netcat enhanced with twofish encryption"
arch=(i686 x86_64)
url="https://cryptcat.sourceforge.net"
license=('GPLv2')
provides=('cryptcat')
source=("http://heanet.dl.sourceforge.net/project/cryptcat/cryptcat-unix-1.2/cryptcat-unix-1.2.1/cryptcat-unix-1.2.1.tar" "cryptcat-unix-1.2.1.tar.sig")
sha512sums=('2de6521903e489bc6d4f242aaac7f35a3a7fb226e1812ef5f1c3554420fce4378427e94b3e90eca5476d1068f1a9b44d9c5dbd0362888ad893cf66be106deb17' 'SKIP')

build() {
	cd unix
	make linux
}


package() {
        mkdir $pkgdir/usr
        mkdir $pkgdir/usr/bin
	cd unix
	cp -v cryptcat $pkgdir/usr/bin/cryptcat
}
