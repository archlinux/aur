# Contributor: Sergey Kolesov <cucullus.at.mail.ru>
# Previously contributed by StormBlast and Vyazovoi

pkgname=gxneur-fresh
pkgver=0.18.0
pkgrel=1
pkgdesc="GTK frontend for XNeur"
url="http://www.xneur.ru"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libglade' "xneur-fresh>=${pkgver}" 'hicolor-icon-theme' 'gconf')
source=(https://launchpad.net/~andrew-crew-kuznetsov/+archive/xneur-stable/+files/gxneur_${pkgver}+git5.orig.tar.gz)
install=${pkgname}.install

md5sums=('aaa4a8c7666c620b7b366a56ed95ce96')

build() {
   cd ${srcdir}/gxneur-${pkgver}

   ./configure --prefix=/usr
   make
}

package() {
   cd $srcdir/gxneur-${pkgver}
   make DESTDIR=${pkgdir} install
}

