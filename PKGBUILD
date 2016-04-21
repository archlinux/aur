# Maintainer: Po-An,Yang(Antonio) <yanganto@gmail.com>
pkgname=networkminer
pkgver=2.0
pkgrel=2
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
source=("https://www.netresec.com/?download=NetworkMiner")
noextract=("NetworkMiner_2-0.zip")
md5sums=("d094ec9b3fb673ca9c24705be9da1ac9")
validpgpkeys=()

prepare() {
	mv \?download=NetworkMiner NetworkMiner_2-0.zip
	unzip -o NetworkMiner_2-0.zip 
}

build() {
	echo No build needed
}
check(){
	echo No check needed
}
package() {
	mkdir -p $pkgdir/opt/NetworkMiner
	cp -R $srcdir/NetworkMiner_2-0 $pkgdir/opt/NetworkMiner/
	chmod +x $pkgdir/opt/NetworkMiner/NetworkMiner_2-0/NetworkMiner.exe
	chmod -R go+w $pkgdir/opt/NetworkMiner/NetworkMiner_2-0/AssembledFiles/
	chmod -R go+w $pkgdir/opt/NetworkMiner/NetworkMiner_2-0/Captures/
	echo 'mono /opt/NetworkMiner/NetworkMiner_2-0/NetworkMiner.exe' > $pkgdir/opt/NetworkMiner/Networkminer.sh
	chmod +x $pkgdir/opt/NetworkMiner/Networkminer.sh

	mkdir -p $pkgdir/usr/bin
	ln -s /opt/NetworkMiner/Networkminer.sh $pkgdir/usr/bin/networkminer
}

