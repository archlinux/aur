# Maintainer: nblock <nblock [/at\] archlinux DOT us>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: portix <portix@gmx.net>

pkgname=pwman
pkgver=0.4.5
pkgrel=2
pkgdesc="A text-based application for securely storing and managing passwords"
arch=('i686' 'x86_64')
url="https://pwman.sourceforge.net/"
license=('GPL')
depends=('libxml2' 'ncurses' 'gnupg')
makedepends=('glib2')
source=(https://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz
pwman.patch
)
md5sums=('091a97b23bea2f5e02f28f66814df55b'
         '0fb7751695b8b0609db5699b213f3cb7')


build() {
  cd $srcdir/$pkgname-$pkgver
   patch --strip=1 < ../${pkgname}.patch
  ./configure \
    --prefix=/usr \
    --mandir=/usr/share/man
  make 

}
package(){
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}

# vim:set ts=2 sw=2 et:
