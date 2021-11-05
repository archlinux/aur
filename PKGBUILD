# Maintainer: Jah Way <jahway603 at protonmail dot com>

pkgname=astrolog
pkgver=7.30
pkgrel=1
pkgdesc='A 100% freeware astrology program'
url='http://www.astrolog.org'
arch=('x86_64')
license=('GPL2')
source=("$url/ftp/ast73src.zip")
sha256sums=('daf1efea87fc424de8a8416d39d4759ffdb86df9410606ac0a55700614d2deba')

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

