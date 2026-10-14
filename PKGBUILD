# shellcheck shell=bash
# -*- sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname='fhtagn'
pkgdesc='Literate testing for command-line programs'
pkgver=0.3.1
pkgrel=2
url='https://github.com/xonixx/fhtagn'
changelog="$pkgname.changelog"
arch=('any')
license=('MIT')
depends=('awk')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('30f5885fdfb32edf3f03388e2c144d0a5b4d3ebe9184e03bd3398fba3be00b6b')

check() {
  cd "$pkgname-$pkgver"

  ./makesure tested_by_gawk
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm0755 fhtagn.awk "$pkgdir/usr/bin/fhtagn"
  install -Dm0644 README.md  "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm0644 LICENSE    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# eof
