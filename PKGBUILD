# Maintainer: Jonathan Liu <net147@gmail.com>
pkgname=ddrutility
pkgver=2.8
pkgrel=2
pkgdesc="Set of utilities for use with GNU ddrescue to aid with data recovery"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/ddrutility/"
license=('GPL3')
depends=('bash')
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('95293d6ab4290919e3a6efb31e326434')

prepare() {
  cd "$pkgname-$pkgver"
  sed -i 's#/usr/local#/usr#g' makefile
}

build() {
  cd "$pkgname-$pkgver"
  make CFLAGS+="-fcommon"
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
