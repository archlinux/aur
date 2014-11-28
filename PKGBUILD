# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=mudmagic
pkgver=1.9
pkgrel=4
pkgdesc="A GTK2 mud client with automapper"
arch=('i686')
url="http://www.mudmagic.com/mud-client/"
license=('GPL')
depends=('libglade>=2' 'libmxp' 'pcre' 'sqlite3')
makedepends=('pkgconfig')
options=('!libtool')
source=(http://downloads.sourceforge.net/kyndig/$pkgname-$pkgver.tar.gz)
md5sums=('25d106683edaf8241700aea22de27e83')

build() {
  cd ${srcdir}/$pkgname-$pkgver

  ./configure --prefix=/usr --disable-static --mandir=/usr/share/man
  make || return 1
  make DESTDIR=${pkgdir} install
}
