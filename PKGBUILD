# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname='docfd-bin'
_pkgname="${pkgname/-bin/}"
_flavour='ubuntu-latest'
pkgver=4.0.0
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
  '17f2a1c1551e44dce286d41f12dc576d5b8293cdc9d07a7db0bb304bcd179fec'
  'SKIP' 'SKIP' 'SKIP'
)
b2sums=(
  '2eddbd3002c6e0673d16c15647b056b01382d5343b8e207e6a4794bc5a10f5bf1fbb331663e3b155b0c1e23ff63ed34d100f97571b93db6c0bb8713e087fc599'
  'SKIP' 'SKIP' 'SKIP'
)

# eof
