# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname='docfd-bin'
_pkgname="${pkgname/-bin/}"
_flavour='ubuntu-latest'
pkgver=2.2.0
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
  'c5f1def0ef7b29b8ae3e3ed86ae9cb24eb5788ba408d612ca6251093e7f98d3a'
  'SKIP' 'SKIP' 'SKIP'
)
b2sums=(
  '618773aa746ee4ea3f8a7b1f99d9a3fbd5ce54499b1b2db63db7150a894a17bf723cbdff90a347ba1c524d95f2c1d0ce32dd74800891d29a56fd1af084e38739'
  'SKIP' 'SKIP' 'SKIP'
)

# eof
