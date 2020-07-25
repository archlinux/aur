# Contributor: Barry <brrtsm at gmail dot com>
# Contributor: Joerg Schuck <joerg_schuck at web dot de>
# Contributor: Tyler <tjb0607 at gmail dot com>
# Contributor: Austin <doorknob60 at gmail dot com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=gif2apng
pkgver=1.9
pkgrel=1
pkgdesc="Tool for disassembling apng files"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/$pkgname/"
license=('zlib')
depends=('libpng')
source=("http://sourceforge.net/projects/$pkgname/files/${pkgver}/$pkgname-${pkgver}-src.zip")
sha512sums=('6f161699aad949466c60e0fb6abb2f38e7ec8353dd15e65ccb9944a66dabc5a4acf32523cb64073c73290e54cc2b753db68123c14f3f7789343491a4f65dcd2c')

build() {
  make LDFLAGS+=" -Wall -pedantic -g -Wl,-z,relro,-z,now"
}

package() {
  install -Dm755 "$pkgname" -t "$pkgdir"/usr/bin/
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  head -29  $pkgname.cpp > "$pkgdir"/usr/share/licenses/$pkgname/zlib.license
}

