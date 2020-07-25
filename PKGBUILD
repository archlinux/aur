# Contributor: Barry <brrtsm at gmail dot com>
# Contributor: Joerg Schuck <joerg_schuck at web dot de>
# Contributor: Tyler <tjb0607 at gmail dot com>
# Contributor: Austin <doorknob60 at gmail dot com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=apngdis
pkgver=2.9
pkgrel=1
pkgdesc="Tool for disassembling apng files"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/apngdis/"
license=('zlib')
depends=('libpng')
source=("http://sourceforge.net/projects/apngdis/files/${pkgver}/$pkgname-${pkgver}-src.zip")
sha512sums=('4bcce5066c37ea5e4db0bfaf2f6a81e4d3ba7f5b6c952f598facff27f84cc1a3af778f4db096119cb9f4aa57c0193c90acf7bed28f283b6930f5b3121dd9cf32')

build() {
  gcc -Wall -pedantic -g -Wl,-z,relro,-z,now -o $pkgname $pkgname.cpp -lstdc++ -lpng
}

package() {
  install -Dm755 "$pkgname" -t "$pkgdir"/usr/bin/
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  head -29  $pkgname.cpp > "$pkgdir"/usr/share/licenses/$pkgname/zlib.license
}

