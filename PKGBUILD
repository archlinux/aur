#!/bin/bash

# Maintainer: someone5678 <someone5678 dot dev at google dot com>

pkgname=ktfmt
pkgver=0.59
pkgrel=1
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
sha256sums=('a493271c137074436a133d72e9e323f91604c97e0c40555629ec39598efead54'
            '62228af9300c9ee416aeef97fb589a91ddcd321e6b262e5e5c0924d26cb4ef52'
            '5f1521fb886be393d8afc4655ab7c6ffe84e1d4f15dfd321ceec3ce62968d058')

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver-with-dependencies.jar" "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"
  install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE* -t "$pkgdir/usr/share/licenses/$pkgname"
}
