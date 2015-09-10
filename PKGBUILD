#Maintainer: ovi chis <ovi@ovios.org>
pkgname=libqb 
pkgver=0.17.1 
pkgrel=1
pkgdesc='Library with the primary purpose of providing high performance client server reusable features' 
arch=(
  i686
  x86_64
  mips64el ) 

makedepends=(
  doxygen
  splint
)
license=LGPL2.1

options=(!libtool)

url=https://github.com/asalkeld/$pkgname/wiki 
source=https://github.com/asalkeld/$pkgname/archive/v$pkgver.tar.gz 


build() { 
cd $srcdir/$pkgname-$pkgver
  setarch $CARCH ./autogen.sh
  setarch $CARCH ./configure --prefix=/usr\
    --disable-fatal-warnings\
    --disable-static\
    --libdir=/usr/lib\
    --sbindir=/usr/bin
  setarch $CARCH make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  setarch $CARCH make DESTDIR=$pkgdir install
}
sha512sums=('e5dcc70cd4dc7b20ef7972f1e791299e837ba07c0e24060182a503ab434d52d85f3f2224a2c20fe6a25d31311b7cc5848b50ff84ff3a3aa6e9200eec55e15bf3')
