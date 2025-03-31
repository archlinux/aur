# -*- sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname='fhtagn'
pkgver=0.2.1
pkgrel=3
pkgdesc='Literate testing for command-line programs'
arch=('any')
url='https://github.com/xonixx/fhtagn'
license=('MIT')  # SPDX-License-Identifier: MIT
depends=('awk')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")

check() {
  cd "$pkgname-$pkgver"

  # Please note that this will download tush
  ./makesure tested_by_gawk
}

package() {
  cd "$pkgname-$pkgver"

  install -vDm0755 fhtagn.awk "$pkgdir/usr/bin/fhtagn"
  install -vDm0644 README.md  "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -vDm0644 LICENSE    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha256sums=(
  '8695bf88d66f3df0e2fc9fe275bb181039ca060ebbbb9ca2e838c1ae207d19c4'
)
b2sums=(
  '477f9d9a63be11d3db1a82c50f43031e0cb7185165513e8312b742228442aa8780cfd7947efb5419311a83e977b795d2eee6a47cd3db5d7b8eba5f0aa1a0e869'
)

# eof
