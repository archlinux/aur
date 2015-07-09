# Contributor: Sergey Kolesov <cucullus.at.mail.ru>
# Previously contributed by StormBlast and Vyazovoi

pkgname=gxneur
pkgver=0.17.0
pkgrel=1
pkgdesc="GTK frontend for XNeur"
url="http://www.xneur.ru"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libglade' "xneur>=${pkgver}" 'hicolor-icon-theme' 'gconf')
source=(https://launchpad.net/~andrew-crew-kuznetsov/+archive/xneur-stable/+files/gxneur_${pkgver}.orig.tar.gz)
install=${pkgname}.install

md5sums=('824903cb3c37646ddb5ac701413058f3')

build() {
   cd ${srcdir}/${pkgname}-${pkgver}

   ./configure --prefix=/usr
   make
}

package() {
   cd $srcdir/${pkgname}-${pkgver}
   make DESTDIR=${pkgdir} install
}

