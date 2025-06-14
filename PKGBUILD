# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>
# -*- mode: sh -*-

pkgname=detect-old-python-modules
pkgver=0.0.3
pkgrel=1
pkgdesc='Detect old modules after Python upgrade (ALPM hook)'
arch=('any')
url='https://codeberg.org/kas/detect-old-python-modules'
license=('EUPL-1.2')  # SPDX-License-Identifier: EUPL-1.2
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
  '4cd11b30b9935c33ccd10af639589bd134c3923596e8dc55ec592b9b4da97edd'
)

# eof
