#!/bin/bash

# Maintainer: Claudio Nave <claudio nave nine seven at gmail dot com>
# Contributor: PumpkinCheshire <me at pumpkincheshire dot com>
# Contributor:  <tigersoldi at gmail dot com>

pkgname=google-java-format
pkgver=1.21.0
pkgrel=1
pkgdesc='Reformats Java source code to comply with Google Java Style'
url='https://github.com/google/google-java-format'
arch=('any')
license=('Apache-2.0 AND NCSA')
depends=('java-runtime' 'bash')
source=(
  "https://github.com/google/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver-all-deps.jar"
  "$pkgname"
  "https://raw.githubusercontent.com/google/$pkgname/master/LICENSE"
)
sha256sums=('1e69f8b63c39a5124a8efb7bad213eb9ac03944339eb9580ae210b0c60565d9b'
            '5869a6ec4dd3c681b06e9a0fa1cdef30d0ee722d48115ff4a5e1efb01947e100'
            '2c7e23c8000fe553b6f380b5e365dd72198439174f1b6821d5e3b190b54af0dc')

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver-all-deps.jar" "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"
  install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE* -t "$pkgdir/usr/share/licenses/$pkgname"
}
