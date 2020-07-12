# Maintainer: robertfoster

pkgname=ostinato
pkgver=1.1
pkgrel=1
url="http://ostinato.org/"
pkgdesc="Cross-platform network packet/traffic generator and analyzer"
source=("https://github.com/pstavirs/ostinato/archive/v$pkgver.tar.gz")
arch=('i686' 'x86_64')
depends=('protobuf' 'qt5-base' 'libpcap')
optdepends=('wireshark-cli' 'gzip' 'diffutils' 'awk')
license=(GPL)

build(){
	cd $srcdir/$pkgname-$pkgver
	QT_SELECT=qt5 qmake PREFIX=/usr -config release
	make
}

package(){
	cd $srcdir/$pkgname-$pkgver
	make INSTALL_ROOT=$pkgdir install
}

md5sums=('3cd0cce3e368c64eb531a6eba2cdee1f')
