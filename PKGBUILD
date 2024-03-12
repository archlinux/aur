# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname='docfd-bin'
_pkgname="${pkgname/-bin/}"
_flavour='ubuntu-latest'
pkgver=3.0.0
pkgrel=1
pkgdesc='TUI multiline fuzzy document finder (pre-compiled)'
arch=('x86_64')
url='https://github.com/darrenldl/docfd'
_rawurl='https://raw.githubusercontent.com/darrenldl/docfd/main'
license=('MIT')  # SPDX-License-Identifier: MIT
provides=('docfd')
conflicts=('docfd')
source=(
  "$url/releases/download/$pkgver/$_pkgname-$pkgver-$_flavour.tar.gz"
  "$_rawurl/CHANGELOG.md"
  "$_rawurl/LICENSE"
  "$_rawurl/README.md"
)
changelog="$pkgname.changelog"

package() {
  install -Dm0755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm0644 "LICENSE"   "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  for _doc in {CHANGELOG,README}.md; do
    install -Dm0644 "$_doc" "$pkgdir/usr/share/docs/$pkgname/$_doc"
  done
}

sha256sums=(
  '9c767cfd958374747137308c81f697907a65d8ec011a3bfc95cbc075cb2522d1'
  'SKIP' 'SKIP' 'SKIP'
)
b2sums=(
  '1199f38a4f45b9e192c36a92fa5ec7442e9dd42bba05417b3dde250d36169ff6dc99343098a853429db6059d566dd29a95bc553a3308bf4d7dc80120f749301e'
  'SKIP' 'SKIP' 'SKIP'
)

# eof
