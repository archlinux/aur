# Maintainer: robertfoster

pkgname=ostinato
pkgver=0.9
pkgrel=1
url="http://ostinato.org/"
pkgdesc="Cross-platform network packet/traffic generator and analyzer"
source=("https://github.com/pstavirs/ostinato/archive/v$pkgver.tar.gz")
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

md5sums=('c93573a3d59433d785a44b2a5740e1a3'
         '6502b6ebefecc7018e8d50630b3f6320')
