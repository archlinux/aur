# Maintainer: M0Rf30

pkgname=ostinato
pkgver=0.8
pkgrel=1
url="http://code.google.com/p/ostinato/"
pkgdesc="Cross-platform network packet/traffic generator and analyzer"
source=("http://dl.bintray.com/pstavirs/ostinato/ostinato-src-$pkgver.tar.gz")
arch=('i686' 'x86_64')
depends=('protobuf' 'qt4' 'libpcap')
optdepends=('wireshark-cli' 'gzip' 'diffutils' 'awk')
license=(GPL)

build(){
   cd $srcdir/$pkgname-$pkgver
   chmod 644 COPYING
   qmake-qt4 PREFIX=/usr
   make
}

package(){
   cd $srcdir/$pkgname-$pkgver
   make INSTALL_ROOT=$pkgdir install
}

md5sums=('8333c849044f5edad1190831d748110f')
