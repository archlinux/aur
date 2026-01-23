# shellcheck shell=bash
# -*- mode: sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname='ttf-xenia'
pkgdesc='Monospaced font designed to not to be fugly'
pkgver=1.0.0
pkgrel=1
url='https://github.com/Loretta1982/xenia'
_raw='https://raw.githubusercontent.com/Loretta1982/xenia/refs/heads/main'
arch=('any')
license=('LicenseRef-XeniaMonofont')
provides=('ttf-font')
source=(
  "xenia_family-$pkgver.zip::$url/releases/download/v$pkgver/xenia_family.zip"
  "$_raw/LICENSE"
  "$_raw/README.md"
)
sha256sums=(
  '6d63a6cfba4cc06a9831b790f8b61911a41d9d06cf5a7a910177951b41938d75'
  'SKIP' 'SKIP'
)

package() {
  install -vDm0644 -t "$pkgdir/usr/share/fonts/TTF" ./*.ttf
  install -vDm0644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
  install -vDm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

# eof
