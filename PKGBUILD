# Maintainer: Jah Way <jahway603 at protonmail dot com>

pkgname=astrolog
pkgver=7.50
pkgrel=1
pkgdesc='A 100% freeware astrology program'
url='http://www.astrolog.org'
arch=('x86_64')
license=('GPL2')
source=("$url/ftp/ast75src.zip")
sha256sums=('cc41d91ace9dce658450faf0924a6288c544d0fb2dde91691195cf30a3e851df')

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

