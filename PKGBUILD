# -*- sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>

pkgname='docfd-bin'
_pkgname="${pkgname/-bin}"
pkgver=7.1.0
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
  '328949f3018f29b46942908ac6dbddad1e0f238c9fb3c9e6babe7ecacaee02fe'
  'SKIP' 'SKIP' 'SKIP'
)
b2sums=(
  '2646a733dcc8da74de120f372a643c28fc4e74b33565ddfb4960fd8eed3b38ff15db1e8eb9405820387e7ddda884b0f1cc258e0445620ae1f2bb6c5f11159843'
  'SKIP' 'SKIP' 'SKIP'
)

# eof
