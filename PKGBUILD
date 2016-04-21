# Maintainer: Po-An,Yang(Antonio) <yanganto@gmail.com>
pkgname=networkminer
pkgver=2.0
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
	cp -R $srcdir/NetworkMiner_2-0 $pkgdir/opt/
	chmod +x $pkgdir/opt/NetworkMiner.exe
	chmod -R go+w $pkgdir/opt/AssembledFiles/
	chmod -R go+w $pkgdir/opt/Captures/
	echo 'mono /opt/NetworkMiner.exe' > $pkgdir/opt/Networkminer.sh
	chmod +x $pkgdir/opt/Networkminer.sh

	mkdir -p $pkgdir/usr/bin
	ln -s /opt/Networkminer.sh $pkgdir/usr/bin/networkminer
}

