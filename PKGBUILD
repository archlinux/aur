# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=vicare-scheme  
pkgver=0.3d7
pkgrel=1
pkgdesc="R6RS scheme implementation"
url="http://marcomaggi.github.io/vicare.html"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('gmp')
install=$pkgname.install
source=(http://sourceforge.net/projects/$pkgname/files/0.3/$pkgname-$pkgver.tar.xz)
md5sums=('59e9103da8a87e1185a2681443f58c71')
build() {
  cd $srcdir/$pkgname-$pkgver
  LDFLAGS="-Wl,-z,noexecstack" ./configure --prefix=/usr --libexecdir=/usr/lib
  make 
}
package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
