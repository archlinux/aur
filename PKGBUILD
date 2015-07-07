# Maintainer: schmoemi <schmoemi at arcor dot de>
# Contributor: reMiND <detanator at gmail dot com>

pkgname=aqemu
pkgver=0.8.2
pkgrel=4
pkgdesc="QEMU GUI written in Qt4"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/aqemu/"
license=('GPL2')
depends=('qemu' 'qt4' 'openssl' 'libvncserver')
makedepends=('cmake')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.bz2 aqemu.patch)
md5sums=('dcec083f566e0a22df7bfe8e7ca4c593' '4f18e403b98b825a7582aab7c5c3e871')

build() {

  cd $srcdir/$pkgname-$pkgver
  patch -p1 -i $srcdir/aqemu.patch
  cmake -DCMAKE_INSTALL_PREFIX=/usr/ -DQT_QMAKE_EXECUTABLE=qmake4
  make
}

  package() {
  
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}