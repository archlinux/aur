# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=biblesync  
pkgver=1.1.2
pkgrel=2
pkgdesc="multicast shared co-navigation library for Bible programs"
url="http://sourceforge.net/projects/gnomesword/files/BibleSync/1.1.2/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libutil-linux' 'gcc-libs')
makedepends=('cmake')
source=("http://downloads.sourceforge.net/project/gnomesword/BibleSync/$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('25bc063de3da2fc087954c746714f735')

build() {
  cd $srcdir/$pkgname-$pkgver
  [[ -d build ]] || mkdir -p build
  cd build
  cmake -DBUILD_SHARED_LIBS=TRUE -DCMAKE_INSTALL_PREFIX=/usr -DLIBDIR=/usr/lib ..
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver/build 
  make DESTDIR=$pkgdir install
}
