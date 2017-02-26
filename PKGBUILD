# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=biblesync  
pkgver=1.1.2
pkgrel=3
pkgdesc="multicast shared co-navigation library for Bible programs"
url="http://sourceforge.net/projects/gnomesword/files/BibleSync/1.1.2/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libutil-linux' 'gcc-libs')
makedepends=('cmake')
source=("http://downloads.sourceforge.net/project/gnomesword/BibleSync/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('7725c8228e2dff79edaf065ff4d4816a6cf214d1d874817345cc4154142144bce479ca1ae871053886bff4f6610715a27bce81c25c2a636444d5873e93bfdc62')

build() {
  cd $pkgname-$pkgver
  [[ -d build ]] || mkdir -p build
  cd build
  cmake -DBUILD_SHARED_LIBS=TRUE -DCMAKE_INSTALL_PREFIX=/usr -DLIBDIR=/usr/lib ..
  make
}

package() {
  cd $pkgname-$pkgver/build 
  make DESTDIR=$pkgdir install
}
