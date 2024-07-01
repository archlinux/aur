# -*- mode: sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>

pkgname='fuc-bin'
pkgver=2.2.0
pkgrel=1
pkgdesc='Fast Unix Commands: Modern, performance focused unix commands (pre-compiled)'
arch=('aarch64' 'x86_64')
url='https://github.com/SUPERCILEX/fuc'
license=('Apache-2.0')  # SPDX-License-Identifier: Apache-2.0
provides=('cpz' 'fuc' 'rmz')
conflicts=('cpz' 'fuc' 'rmz')
_readme='https://raw.githubusercontent.com/SUPERCILEX/fuc/master/README.md'
source_aarch64=(
  "cpz-aarch64-$pkgver::$url/releases/download/$pkgver/cpz-aarch64-unknown-linux-gnu"
  "rmz-aarch64-$pkgver::$url/releases/download/$pkgver/rmz-aarch64-unknown-linux-gnu"
  "$_readme"
)
source_x86_64=(
  "cpz-x86_64-$pkgver::$url/releases/download/$pkgver/cpz-x86_64-unknown-linux-gnu"
  "rmz-x86_64-$pkgver::$url/releases/download/$pkgver/rmz-x86_64-unknown-linux-gnu"
  "$_readme"
)
noextract=(
  "cpz-$CARCH-$pkgver"
  "rmz-$CARCH-$pkgver"
)
depends=('gcc-libs' 'glibc')

package() {
  for _exe in cpz rmz; do
    install -vDm0755 "$_exe-$CARCH-$pkgver" "$pkgdir/usr/bin/$_exe"
  done

  install -vDm0644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}

sha256sums_aarch64=(
  '73701d8ccc5a61ad88ad85a41db560259ef0b576cf9c83cfced3a79dbdc81af7'
  'b5ebad77351a7d45e17c5554d97d700fd7ad28ab1217f28f6df20af0780b0b03'
  'SKIP'
)
sha256sums_x86_64=(
  'bec8b88361a3dcbba2c770bcf0a5645d2fe38e90f1e50156fc3034a3fb4c1ecd'
  'bc97cdc30b965fa9b848ea8734a7ba9bd41ca96446234e0d2bb7a4204b1ff6c9'
  'SKIP'
)

# eof
