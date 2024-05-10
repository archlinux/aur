# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- mode: sh -*-

pkgname=detect-old-python-modules
pkgver=0.0.1
pkgrel=1
pkgdesc='Detect old modules after Python upgrade (ALPM hook)'
arch=('any')
url='https://codeberg.org/kas/detect-old-python-modules'
license=('AGPL-3.0-or-later')  # SPDX-License-Identifier: AGPL-3.0-or-later
depends=('python')
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
)

package() {
  cd "$pkgname/src"

  install -vDm0644 "$pkgname.hook" \
    "$pkgdir/usr/share/libalpm/hooks/$pkgname.hook"
  install -vDm0644 "$pkgname.py"   \
    "$pkgdir/usr/share/libalpm/scripts/$pkgname.py"
}

sha256sums=(
  '6378557a3dcd1b2bf2edbf37ef80dd3c30a0bfaab69292256583e7005ae6e09a'
)

# eof
