# Maintainer: Ellis Kenyo <elken dot tdos at gmail dot com>

pkgname=yesplz
pkgver=1
pkgrel=1
depends=()
makedepends=('glibc' 'libjpeg-turbo' 'libx11' 'elfutils' 'libxcb' 'libxau' 'libxdmcp')
url=('http://uberleethackerforce.deepgeek.us/')
license=('custom')
pkgdesc="Unixporn.com image screenshot & uploader (Courtesy of sigFLUP)"
arch=('any')
source=('http://ponce.cc/slackware/sources/repo/yesplz_aug_4_2010.tgz')
md5sums=('5dfbc9adc87ac088c8ef255d7fb86891')

build() {
  cd "$srcdir/yesplz_aug_4_2010"
  ./configure --prefix=/usr

  make
}

package() {
  cd "$srcdir/yesplz_aug_4_2010"

  install -D -m755 "$srcdir/yesplz_aug_4_2010/yesplz" "$pkgdir/usr/bin/yesplz"
  echo "Released under Public Domain by sigFLUP" >> "$srcdir/LICENSE"
  install -D -m644 "$srcdir/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
