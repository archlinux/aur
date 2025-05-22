# -*- mode: sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname='fuc-bin'
pkgver=3.1.0
pkgrel=1
pkgdesc='Fast Unix Commands: Modern, performance focused unix commands (pre-compiled)'
arch=('aarch64' 'x86_64')
url='https://github.com/SUPERCILEX/fuc'
license=('Apache-2.0')  # SPDX-License-Identifier: Apache-2.0
provides=('cpz' 'fuc' 'rmz')
conflicts=("${provides[@]}")
_readme='https://raw.githubusercontent.com/SUPERCILEX/fuc/master/README.md'
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

  install -vDm0644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}

sha256sums_aarch64=(
  'e1a9c7bb59c94047ed54f835cdf5852e8b438cc37f6f2c3918f0ba900add8d8e'
  '262284f5d250f97a4f2da1c31003a305a50a9cfbcc90237979fff740390d0d02'
  'SKIP'
)

sha256sums_x86_64=(
  '6b093d6029c98cb29d26f7e0737ce5e33b286dca8b7eb9be12ae5ccabfeb9df6'
  'f5d96c847c1f2bb9d1ae548393570912d24ad3f5a4b1024d2728787b363c667e'
  'SKIP'
)

# eof
