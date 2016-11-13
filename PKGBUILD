# Maintainer: graysky <graysky AT archlinux DOT us>

pkgname=data_hacks
pkgver=0.3.1
pkgrel=1
pkgdesc="Command line utilities for data analysis"
arch=('any')
url="https://github.com/bitly/data_hacks"
license=('GPL')
depends=('python2')
source=("https://github.com/bitly/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('188afca43dba6a8267d76f2ffd961a50ded17313a2b273c90e3c9561007a4efa')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1

  cd "$pkgdir/usr/bin"
  for i in *.py; do
    sed -i 's|^#!.*python$|#!/usr/bin/python2|' "$i"
  done
}

# vim:set ts=2 sw=2 et:
