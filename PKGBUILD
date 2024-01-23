# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname='docfd-bin'
_pkgname="${pkgname/-bin/}"
_flavour='ubuntu-latest'
pkgver=2.0.0
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
  'a67aafb0222b0057af74ce417be41711aaa2a32620bac36decdb2482a105af76'
  'SKIP' 'SKIP' 'SKIP'
)
b2sums=(
  '2a570fdb38428e9ff577a5894e6fc2857e2b5b2b27eeb3483543157368732499355a2a44b60550ed4f149276bccd6879f46c9031ea4aaac89beb8fadc17db471'
  'SKIP' 'SKIP' 'SKIP'
)

# eof
