# Maintainer: Jah Way <jahway603 at protonmail dot com>

pkgname=astrolog
pkgver=7.70
pkgrel=1
pkgdesc='A 100% freeware astrology program'
url='http://www.astrolog.org'
arch=('x86_64')
license=('GPL2')
source=("$url/ftp/ast77src.zip")
sha256sums=('9f36bf56aecc12334bcdcec191474bc41955af80729bf27a71e782a389db7cda')

build() {
  cc -c -O *.cpp
  cc -o astrolog *.o -lm -lX11 -ldl
  strip $pkgname
}

package() {
  install -Dm644 "license.htm" "$pkgdir/usr/share/licenses/${pkgname}/license.htm"
  install -Dm755 "$pkgname" "$pkgdir/opt/${pkgname}/$pkgname"

  install -d "${pkgdir}/usr/bin"
  ln -s /opt/${pkgname}/$pkgname "${pkgdir}/usr/bin"
}

