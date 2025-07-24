# -*- mode: sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname='fuc-bin'
pkgver=3.1.1
pkgrel=1
pkgdesc='Fast Unix Commands: Performance focused alternatives to cp(1) and rm(1) (pre-compiled)'
arch=('aarch64' 'x86_64')
url='https://github.com/SUPERCILEX/fuc'
license=('Apache-2.0')  # SPDX-License-Identifier: Apache-2.0
provides=('cpz' 'fuc' 'rmz')
conflicts=("${provides[@]}")
_readme="README-$pkgver.md::https://raw.githubusercontent.com/SUPERCILEX/fuc/master/README.md"
source_aarch64=(
  "cpz-aarch64-$pkgver::$url/releases/download/$pkgver/aarch64-unknown-linux-gnu-cpz"
  "rmz-aarch64-$pkgver::$url/releases/download/$pkgver/aarch64-unknown-linux-gnu-rmz"
  "$_readme"
)
source_x86_64=(
  "cpz-x86_64-$pkgver::$url/releases/download/$pkgver/x86_64-unknown-linux-gnu-cpz"
  "rmz-x86_64-$pkgver::$url/releases/download/$pkgver/x86_64-unknown-linux-gnu-rmz"
  "$_readme"
)
noextract=(
  "cpz-$CARCH-$pkgver"
  "rmz-$CARCH-$pkgver"
)
depends=('glibc')

package() {
  for _exe in cpz rmz; do
    install -vDm0755 "$_exe-$CARCH-$pkgver" "$pkgdir/usr/bin/$_exe"
  done

  install -vDm0644 "README-$pkgver.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}

sha256sums_aarch64=(
  '9fb5eabcb32133c909d06547fc10007cd16252887e1b95b5a534eb7b6799a897'
  '1ac8e83a0242938b10bd6a37ebd1b96d92896f84547aead32f3608c3e5ff733d'
  'SKIP'
)

sha256sums_x86_64=(
  'fac6c8f4081b7c54ae5e68ae8c9b37ac840a8b763faedae4636f3554ce9749d8'
  '9017131f24a6a619568316d3cf1aabbf4fb8297d8082b11fd2b6817436876a3b'
  'SKIP'
)

# eof
