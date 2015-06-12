# Maintainer: Simon Conseil <contact+aur at saimon dot org>
pkgname=peat
pkgver=0.3.0
pkgrel=1
pkgdesc="Repeat commands!"
arch=('any')
url="https://github.com/sjl/peat"
license=('GPL3')
depends=('python2')
source=("https://github.com/sjl/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('c8826f667d69e274e476966806adaf30')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" peat

  mkdir -p "$pkgdir/usr/bin"
  install -m755 "$srcdir/$pkgname-$pkgver"/peat "$pkgdir"/usr/bin/peat
}
