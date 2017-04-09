# Contributor: Sergey Kolesov <cucullus.at.mail.ru>
# Previously contributed by StormBlast and Vyazovoi

pkgname=gxneur
pkgver=0.20.0
pkgrel=2
pkgdesc='GTK frontend for XNeur'
url="http://www.xneur.ru"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libglade' "xneur>=$pkgver" 'gconf' 'xorg-xprop')
source=("https://raw.githubusercontent.com/AndrewCrewKuznetsov/xneur-devel/master/dists/$pkgver/gxneur_$pkgver.orig.tar.gz")
md5sums=('fbd9099e998f49a95ff44d6c922097d2')

build() {
   cd $srcdir/$pkgname-$pkgver
   ./configure --prefix=/usr
   make
}

package() {
   cd $srcdir/$pkgname-$pkgver
   make DESTDIR=$pkgdir install
}
