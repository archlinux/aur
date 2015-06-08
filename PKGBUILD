# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=oak  
pkgver=1.5.0
pkgrel=1 
pkgdesc="Tool to monitor syslogs from a collection of servers"
url="http://www.ktools.org/oak/"
arch=('i686' 'x86_64')
license=('custom')
depends=('glibc')
makedepends=('smtp-server')
source=(http://www.ktools.org/dist/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('69ccdfae317b8f6bb6bf1f27aae5bd02')
build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
  make
}
package() {
  install -Dm755 $srcdir/$pkgname-$pkgver/$pkgname $pkgdir/usr/bin/$pkgname
  install -d $pkgdir/usr/share/licenses/$pkgname
  head -9 $srcdir/$pkgname-$pkgver/oak.c | cut -b 3- > \
    $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
