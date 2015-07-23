# Contributor: linuxSEAT <--put_my_name_here--@gmail.com>

pkgname=libitl
pkgver=0.7.0
pkgrel=6
pkgdesc="The Islamic tools library for prayer times and Hijri calculations"
url="http://www.arabeyes.org/"
arch=('i686' 'x86_64')
license=('LGPL')
depends=('glibc')
source=(http://downloads.sourceforge.net/arabeyes/$pkgname-$pkgver.tar.gz)
md5sums=(86d7fadce96433dde67df61190b0bd0b)

build() {
  LDFLAGS=""
  CFLAGS="-fPIC ${CFLAGS}"
  CXXFLAGS="${CFLAGS}"
  cd $srcdir/$pkgname-$pkgver 
  ./autogen.sh 
  ./configure --prefix=$pkgdir/usr
}

package() {
  cd $srcdir/$pkgname-$pkgver 
  make install || return 1
  chmod 644 $pkgdir/usr/lib/itl/*
}
