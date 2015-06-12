# Maintainer: Simon Conseil <contact+aur at saimon dot org>
pkgname=friendly-find
pkgver=0.3.2
pkgrel=1
pkgdesc="A friendlier find (ffind)."
arch=('any')
url="https://github.com/sjl/friendly-find"
license=('GPL3')
depends=('python2')
source=("https://github.com/sjl/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('69f02172ab77430a61ec7b55f527db0b')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" ffind

  mkdir -p "$pkgdir/usr/bin"
  install -m755 "$srcdir/$pkgname-$pkgver"/ffind "$pkgdir"/usr/bin/ffind
}
