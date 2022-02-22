# Maintainer: Fahim Montasir Misbah <fahimscirex@tutanota.com>
# Contributor: Malte Rabenseifner <malte@zearan.de>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Bernhard Walle <bernhard.walle@gmx.de>

pkgname=libnxml
pkgver=0.18.4
pkgrel=1
pkgdesc="C library for parsing, writing and creating XML 1.0 and 1.1 files or streams"
url="https://github.com/bakulf/libnxml"
license=('LGPL')
depends=('curl')
arch=('i686' 'x86_64')
options=('!libtool')
source=($pkgname-$pkgver::git+https://github.com/bakulf/libnxml.git)
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./autogen.sh
  ./configure --prefix=/usr || return 1
  make || return 1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  sudo make install || return 1
}
