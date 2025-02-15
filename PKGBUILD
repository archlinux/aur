# -*- mode: sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname='fuc-bin'
pkgver=3.0.0
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
  'edf3194a4164d27261e2293386973f854b77fbd9469251159a27e95a73968287'
  'c808647f20fb2b425f236b152938841652948b24e285bf9edfb7991ec902101e'
  'SKIP'
)
sha256sums_x86_64=(
  'f8592579010e31f4532857fe002451be72ada43f2977f367f379f047c3c544d3'
  '12b2285059b1c4246427d81546d872f8c808f96c20779f35c8191b006789f802'
  'SKIP'
)

# eof
