# Contributor: Sergey Kolesov <cucullus.at.mail.ru>
# Previously contributed by StormBlast and Vyazovoi

pkgname=gxneur
pkgver=0.19.0
pkgrel=1
pkgdesc='GTK frontend for XNeur'
url="http://www.xneur.ru"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libglade' "xneur>=$pkgver" 'gconf')
source=("https://raw.githubusercontent.com/AndrewCrewKuznetsov/xneur-devel/master/dists/$pkgver/gxneur_$pkgver.orig.tar.gz")
md5sums=('42f43cdc16517c84ef1b6ac64b8b9fb3')

build() {
   cd $srcdir/$pkgname-$pkgver
CPPFLAGS="-Wno-misleading-indentation -Wno-unused-variable"
   ./configure --prefix=/usr
   make
}

package() {
   cd $srcdir/$pkgname-$pkgver
   make DESTDIR=$pkgdir install
}
