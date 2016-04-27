# Contributor: Sergey Kolesov <cucullus.at.mail.ru>
# Previously contributed by StormBlast and Vyazovoi

pkgname=gxneur
pkgver=0.18.0
pkgrel=1
pkgdesc='GTK frontend for XNeur'
url="http://www.xneur.ru"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libglade' "xneur>=$pkgver" 'gconf')
source=("https://launchpad.net/~andrew-crew-kuznetsov/+archive/ubuntu/xneur-stable/+files/gxneur_$pkgver+git5.orig.tar.gz")
md5sums=('aaa4a8c7666c620b7b366a56ed95ce96')

build() {
   cd $srcdir/$pkgname-$pkgver
   ./configure --prefix=/usr
   make
}

package() {
   cd $srcdir/$pkgname-$pkgver
   make DESTDIR=$pkgdir install
}
