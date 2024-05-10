# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- mode: sh -*-

pkgname=detect-old-python-modules
pkgver=0.0.2
pkgrel=2
pkgdesc='Detect old modules after Python upgrade (ALPM hook)'
arch=('any')
url='https://codeberg.org/kas/detect-old-python-modules'
license=('AGPL-3.0-or-later')  # SPDX-License-Identifier: AGPL-3.0-or-later
depends=('python')
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
)

package() {
  cd "$pkgname"

  install -vDm0644 "README.md"     \
    "$pkgdir/usr/share/doc/$pkgname/README.md"

  cd "src"

  install -vDm0644 "$pkgname.hook" \
    "$pkgdir/usr/share/libalpm/hooks/$pkgname.hook"
  install -vDm0755 "$pkgname.py"   \
    "$pkgdir/usr/share/libalpm/scripts/$pkgname.py"
}

sha256sums=(
  'c9bad73d8d74313b1171f2005519cdf1f25ba65d8caec5f97f643a1aeffa5dd4'
)

# eof
