# Maintainer: Simon Conseil <contact+aur at saimon dot org>
pkgname=friendly-find
pkgver=1.0.0
pkgrel=1
pkgdesc="A friendlier find (ffind)."
arch=('any')
url="https://github.com/sjl/friendly-find"
license=('GPL3')
depends=('python2')
source=("https://github.com/sjl/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('b4cf7d62f07f0e4d3fb67034e7ef6312')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" ffind

  install -Dm755 "$srcdir/$pkgname-$pkgver"/ffind "$pkgdir"/usr/bin/ffind
  install -Dm644 "$srcdir/$pkgname-$pkgver"/ffind.1 "$pkgdir/usr/share/man/man1/ffind.1"
}
