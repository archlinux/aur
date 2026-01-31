# shellcheck shell=bash
# -*- sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname='fhtagn'
pkgdesc='Literate testing for command-line programs'
pkgver=0.3.0
pkgrel=1
url='https://github.com/xonixx/fhtagn'
arch=('any')
depends=('awk')
license=('MIT')  # SPDX-License-Identifier: MIT
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")

check() {
  cd "$pkgname-$pkgver"

  ./makesure tested_by_gawk
}

package() {
  cd "$pkgname-$pkgver"

  install -vDm0755 fhtagn.awk "$pkgdir/usr/bin/fhtagn"
  install -vDm0644 README.md  "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -vDm0644 LICENSE    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha256sums=(
  'a45cb31741f90986d511ada6b50ff22129ed687f7dd1207cc1a96733c599e124'
)
b2sums=(
  '1efb82b37d3398a435b489d1f68261bddff75d3346c1371e78f620a80a18e8431b6aff9d5bb4f6e2797a6fce79dfb22b9829f5f4bc7736e79cdffe5f75f3f8ab'
)

# eof
