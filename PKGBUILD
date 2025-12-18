#!/bin/bash

# Maintainer: someone5678 <someone5678 dot dev at google dot com>

pkgname=ktfmt
pkgver=0.60
pkgrel=2
pkgdesc='A program that reformats Kotlin source code to comply with the common community standard for Kotlin code conventions'
url='https://github.com/facebook/ktfmt'
arch=('any')
license=('Apache-2.0')
depends=('java-runtime' 'bash')
source=(
  "https://repo1.maven.org/maven2/com/facebook/$pkgname/$pkgver/$pkgname-$pkgver-with-dependencies.jar"
  "$pkgname"
  "https://raw.githubusercontent.com/facebook/$pkgname/refs/tags/v$pkgver/LICENSE"
)
sha256sums=('c755828a9ba4be226b9d109fb0112fc3399a1e16d53141c7523bd5eb5fdd8fd0'
            '8205754e3e71b54bddcd9a2a280c29ea1daaf171ee2627c1621425fac9f6d23e'
            '5f1521fb886be393d8afc4655ab7c6ffe84e1d4f15dfd321ceec3ce62968d058')

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver-with-dependencies.jar" "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"
  install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE* -t "$pkgdir/usr/share/licenses/$pkgname"
}
