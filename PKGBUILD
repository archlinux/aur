# Maintainer: Jah Way <jahway603 at protonmail dot com>

pkgname=astrolog
pkgver=7.40
pkgrel=1
pkgdesc='A 100% freeware astrology program'
url='http://www.astrolog.org'
arch=('x86_64')
license=('GPL2')
source=("$url/ftp/ast74src.zip")
sha256sums=('083fa4ef9b406f2437f15dc81396958f3008bfc54ba75c0994ff66e9bec765b6')

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

