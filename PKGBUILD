#!/bin/bash

# Maintainer: Claudio Nave <claudio nave nine seven at gmail dot com>
# Contributor: PumpkinCheshire <me at pumpkincheshire dot com>
# Contributor:  <tigersoldi at gmail dot com>

pkgname=google-java-format
pkgver=1.18.1
pkgrel=1
pkgdesc='Reformats Java source code to comply with Google Java Style'
url='https://github.com/google/google-java-format'
arch=('any')
license=('Apache')
depends=('java-runtime' 'bash')
source=(
  "https://github.com/google/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver-all-deps.jar"
  "$pkgname"
  "https://raw.githubusercontent.com/google/$pkgname/master/LICENSE"
)
sha256sums=('bed3bad433f7df427700648f24b798db3c338d6dcb2cc5c08bc542b55610f910'
            '9670257258a454870c6e389f9a83d964610df184614bf2b38c6997d9b062cf29'
            '2c7e23c8000fe553b6f380b5e365dd72198439174f1b6821d5e3b190b54af0dc')

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver-all-deps.jar" "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"
  install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE* -t "$pkgdir/usr/share/licenses/$pkgname"
}
