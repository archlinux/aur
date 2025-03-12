# -*- mode: sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname='fuc-bin'
pkgver=3.0.1
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
  '2afb1e313d2ccde230e063ed7c6b4944a0d74602dbc4ca2bc2bc202d2d556dc9'
  'af6e636d4d25f3cbf14b0e50dc1f13ee032dc4ff6109604aefcb2151edc4ba39'
  'SKIP'
)
sha256sums_x86_64=(
  'cf8147eda901948c643975e3c29d4b10db9fbfdc475585d57f1446dfaa2fa16f'
  '54f643c6ba170d613c65c48697000faf68d9c77611c10458ea5b1eac99799d25'
  'SKIP'
)

# eof
