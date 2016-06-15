# Contributor: Sergey Kolesov <cucullus.at.mail.ru>
# Previously contributed by StormBlast and Vyazovoi

pkgname=gxneur
pkgver=0.18.0
pkgrel=2
pkgdesc='GTK frontend for XNeur'
url="http://www.xneur.ru"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libglade' "xneur>=$pkgver" 'gconf')
source=("https://raw.githubusercontent.com/AndrewCrewKuznetsov/xneur-devel/master/Launchpad/gxneur_$pkgver+git28.orig.tar.gz")
md5sums=('f828c255b2ab057d97534e2cf633d12d')

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
