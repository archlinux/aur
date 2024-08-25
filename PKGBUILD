# -*- sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>

pkgname='docfd-bin'
_pkgname="${pkgname/-bin}"
pkgver=8.0.0
pkgrel=1
pkgdesc='TUI multiline fuzzy document finder (pre-compiled)'
arch=('x86_64')
url='https://github.com/darrenldl/docfd'
_rawurl='https://raw.githubusercontent.com/darrenldl/docfd/main'
license=('MIT')  # SPDX-License-Identifier: MIT
provides=("$_pkgname")
conflicts=("$_pkgname")
_flavour='linux'
source=(
  "$url/releases/download/$pkgver/$_pkgname-$pkgver-$_flavour.tar.gz"
  "$_rawurl/CHANGELOG.md"
  "$_rawurl/LICENSE"
  "$_rawurl/README.md"
)
changelog="$pkgname.changelog"

package() {
  install -vDm0755 -t "$pkgdir/usr/bin" \
    docfd
  install -vDm0644 -t "$pkgdir/usr/share/docs/$pkgname" \
    {CHANGELOG,README}.md
  install -vDm0644 -t "$pkgdir/usr/share/licenses/$pkgname" \
    LICENSE
}

sha256sums=(
  'f0b425e1f7fe1e0f5295c2c7f45c98ee41dea42e0e74fc1f64016216b0984686'
  'SKIP' 'SKIP' 'SKIP'
)
b2sums=(
  '90e236481bf8ec0e7b0a3489385df058e171c27857170e4b00ea165a32ff2a0821145372161563bbf7d821dfabeec2b01908a430c15c778135a8cee882dae4ad'
  'SKIP' 'SKIP' 'SKIP'
)

# eof
