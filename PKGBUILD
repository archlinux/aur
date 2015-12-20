# Maintainer: Po-An,Yang(Antonio) <yanganto@gmail.com>
pkgname=networkminer
pkgver=1.6.1
pkgrel=1
epoch=
pkgdesc="A packet analyzer"
arch=('any')
url="http://www.netresec.com/"
license=('GPL2')
groups=()
depends=('mono')
makedepends=('unzip')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://sourceforge.net/projects/networkminer/files/networkminer/NetworkMiner-1.6.1/NetworkMiner_1-6-1.zip")
noextract=("NetworkMiner_1-6-1.zip")
md5sums=("e039890b2e820bc82faa8e9919c15b4a")
validpgpkeys=()

prepare() {
	unzip NetworkMiner_1-6-1.zip 
}

build() {
	echo No build needed
}
check(){
	echo No check needed
}
package() {
	cp -R $srcdir/NetworkMiner_1-6-1 $pkgdir/opt/
	chmod +x $pkgdir/opt/NetworkMiner.exe
	chmod -R go+w $pkgdir/opt/AssembledFiles/
	chmod -R go+w $pkgdir/opt/Captures/
	echo 'mono /opt/NetworkMiner.exe' > $pkgdir/opt/Networkminer.sh
	chmod +x $pkgdir/opt/Networkminer.sh

	mkdir -p $pkgdir/usr/bin
	ln -s /opt/Networkminer.sh $pkgdir/usr/bin/networkminer
}

