#!/bin/bash

# Maintainer: EvaristeGalois11 <turbo dot backslid four zero zero at passinbox dot com>
# Contributor: PumpkinCheshire <me at pumpkincheshire dot com>
# Contributor:  <tigersoldi at gmail dot com>

pkgname=google-java-format
pkgver=1.29.0
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
sha256sums=('aeb4e1831d56011e7e06f3393c4e17340c7cca0fd7ba9076ab8dc0624759f7f0'
            '5869a6ec4dd3c681b06e9a0fa1cdef30d0ee722d48115ff4a5e1efb01947e100'
            '2c7e23c8000fe553b6f380b5e365dd72198439174f1b6821d5e3b190b54af0dc')

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver-all-deps.jar" "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"
  install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE* -t "$pkgdir/usr/share/licenses/$pkgname"
}
