# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname='docfd-bin'
_pkgname="${pkgname/-bin/}"
_flavour='ubuntu-latest'
pkgver=2.1.0
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

package() {
  install -Dm0755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm0644 "LICENSE"   "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  for _doc in {CHANGELOG,README}.md; do
    install -Dm0644 "$_doc" "$pkgdir/usr/share/docs/$pkgname/$_doc"
  done
}

sha256sums=(
  '050c1f348534001a2a3c9923ec0a78430e6683af96ad332ced714f646b7705a8'
  'SKIP' 'SKIP' 'SKIP'
)
b2sums=(
  '13ae443f5e8b467c4254f43713cd5ace023c083e9aec94bcc70c3c24d58c68fd5a23474c73141fb5517e10d5ae62a0009e4142a042831bd192eb2dc9d69d7ab8'
  'SKIP' 'SKIP' 'SKIP'
)

# eof
