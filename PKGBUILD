# $Id: PKGBUILD 194152 2016-10-31 13:48:24Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=obextool
pkgver=0.35
pkgrel=4
pkgdesc="A front-end of obexftp"
arch=('any')
url="http://obextool.sf.net"
license=('GPL')
depends=('perl' 'obexftp' 'bwidget' 'tablelist' 'tk')
source=(http://www.tech-edv.co.at/TCMS/downloads/obextool-$pkgver.tar.gz)
md5sums=('4d225b365613fe88f49b3713d5c35136')

package() {
  install -d "$pkgdir"/usr/{share,bin}
  mv "$srcdir"/${pkgname}-$pkgver "$pkgdir"/usr/share/
  cd "$pkgdir"/usr/bin
  echo "#!/bin/bash" > "$pkgdir"/usr/bin/obextool
  echo "/usr/share/$pkgname-$pkgver/obextool.tk \"\$@\"" >> "$pkgdir"/usr/bin/obextool
  chmod +x "$pkgdir"/usr/bin/obextool
}
