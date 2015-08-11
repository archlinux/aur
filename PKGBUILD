# Maintainer: Malte Rabenseifner <malte@zearan.de>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Bernhard Walle <bernhard.walle@gmx.de>

pkgname=libnxml
pkgver=0.18.3
pkgrel=2
pkgdesc="C library for parsing, writing and creating XML 1.0 and 1.1 files or streams"
url="http://www.autistici.org/bakunin/libnxml/"
license=('LGPL')
depends=('curl')
arch=('i686' 'x86_64')
options=('!libtool')
source=(http://www.autistici.org/bakunin/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('857f43970e7f0724d28f4ddc87085daf')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR="$pkgdir" install || return 1
}
