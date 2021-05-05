# Contributor: Barry <brrtsm at gmail dot com>
# Contributor: Joerg Schuck <joerg_schuck at web dot de>
# Contributor: Tyler <tjb0607 at gmail dot com>
# Contributor: Austin <doorknob60 at gmail dot com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=apng2gif
pkgver=1.8
pkgrel=2
pkgdesc="Converting animated pngs to gifs"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/$pkgname/"
depends=('libpng')
license=('zlib')
source=("https://sourceforge.net/projects/$pkgname/files/${pkgver}/$pkgname-${pkgver}-src.zip")
sha512sums=('54fee0bf1e5448531298a816562a611cb5f2f661d40ade622e2d24e58a30de96fa69254ee891c5329e8b065c999b95620215d6e1ae276f0c596ffe69b0b31cda')

build() {
  make CFLAGS+=" -Wall -pedantic -g -Wl,-z,relro,-z,now" \
       LDFLAGS+=" -Wall -pedantic -g -Wl,-z,relro,-z,now" 
}

package() {
  install -Dm755 "$pkgname" -t "$pkgdir"/usr/bin/
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  head -29  $pkgname.cpp > "$pkgdir"/usr/share/licenses/$pkgname/zlib.license
}

