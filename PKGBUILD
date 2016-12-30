# Maintainer: Jordan Day < jordanday444 at gmail dot com >

pkgname=dasm
pkgver=2.20.11
pkgrel=2
_relyear=2014
_relmonth=03
_relday=04
pkgdesc="A versatile macro assembler with support for several 8-bit microprocessors including 6502, 6507, 6803, HD6303, 68HC11, 68705, and F8"
arch=('x86_64')
url="http://dasm-dillon.sourceforge.net/"
source=(https://downloads.sourceforge.net/project/dasm-dillon/dasm-dillon/${pkgver}/${pkgname}-${pkgver}-${_relyear}.${_relmonth}.${_relday}-source.tar.gz)
md5sums=('b160db6d60371bca7ebdad0a374c0c75')
license=('GPL2')
provides=('dasm' 'ftohex')
depends=('glibc')
makedepends=('gcc')

build() {
  cd "$srcdir/${pkgname}-${pkgver}-${_relyear}${_relmonth}${_relday}"
  make
}

package() {
  cd "$srcdir/dasm-${pkgver}-${_relyear}${_relmonth}${_relday}/bin"
  mkdir -p "$pkgdir/usr/bin"
  install -Dm755 ./* "$pkgdir/usr/bin"
}
