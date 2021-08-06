#!/bin/bash

# Maintainer: PumpkinCheshire <me at pumpkincheshire dot top>
# Contributor:  <tigersoldi at gmail dot com>

pkgname=google-java-format
pkgver=1.11.0
pkgrel=2
pkgdesc='Reformats Java source code to comply with Google Java Style'
url='https://github.com/google/google-java-format'
arch=('any')
license=('Apache')
depends=('java-runtime')
source=(
  "https://github.com/google/google-java-format/releases/download/v$pkgver/$pkgname-$pkgver-all-deps.jar"
  'google-java-format'
  'https://raw.githubusercontent.com/google/google-java-format/master/LICENSE'
)
b2sums=(
  '7050e9a2a13fc38f748c28a90b77492f439dcf9543678d59e2f7d71bd35cf15a43db9487b60661b5f3c424f21df175b954b8860a24176e708540b10f6c81cd36'
  'd319ec34e96625bed496ba998e8408eaf49683a4312e37568abc39236c527b4daca21c3361e109964596c2e9387d5d69f26a7b59eb6ea4cd999c2be3bfcf3642'
  'e2f774f14d1d661b483d40d6261bb8b56962c182da6846987c6dea37d099bcb381d2bea2b2de6ba6ead4eb2e3520676540a85600b1fbf4ba39157bd1c24c82a2'
)

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver-all-deps.jar" "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"
  install -Dm755 "$srcdir/google-java-format" "$pkgdir/usr/bin/google-java-format"
  install -Dm644 LICENSE* -t "$pkgdir/usr/share/licenses/$pkgname"
}
