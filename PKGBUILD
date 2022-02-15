#!/bin/bash

# Maintainer: PumpkinCheshire <me at pumpkincheshire dot com>
# Contributor:  <tigersoldi at gmail dot com>

pkgname=google-java-format
pkgver=1.14.0
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
b2sums=('b41ac149a460e4ee30fab5bca1cf232534ff2acb59296fbee949e0913c6f47197367bea058790af6f32ecf72f6c47927868dc2b24385196963d0cc5c04b4555e'
        'eef8cfda2543d4624737340c6b9734f614098fd6ee0d1dc1941c1db65adb30ca360169ba4de9508c9e3b948d75fe0faedd834e9df9a3314ce1b5574bc6c6014c'
        'e2f774f14d1d661b483d40d6261bb8b56962c182da6846987c6dea37d099bcb381d2bea2b2de6ba6ead4eb2e3520676540a85600b1fbf4ba39157bd1c24c82a2')

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver-all-deps.jar" "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"
  install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE* -t "$pkgdir/usr/share/licenses/$pkgname"
}
