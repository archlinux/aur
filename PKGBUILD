# Maintainer: robertfoster

pkgname=ostinato
pkgver=1.0
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

md5sums=('51a5e89f7e84b95e6c54e08505021743')
