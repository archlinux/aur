# Maintainer: Jah Way <jahway603 at protonmail dot com>

pkgname=astrolog
pkgver=8.00
pkgrel=1
pkgdesc='A 100% freeware astrology program'
url='http://www.astrolog.org'
arch=('x86_64')
license=('GPL-2.0-only')
source=("$url/ftp/ast80src.zip")
sha512sums=('80638f04df9dcec04f98072b18c686c52d614c607449608ce0363890b599783d21b72ac3dc98f05239ef0c7b55c25fbe4ea633b0f943caa14fab3fd956023466')

build() {
  cc -c -O *.cpp
  cc -o astrolog *.o -lm -lX11 -ldl
  strip $pkgname
}

package() {
  install -Dm644 "license.htm" "$pkgdir/usr/share/licenses/${pkgname}/license.htm"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}

