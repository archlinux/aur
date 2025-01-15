# -*- sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname='docfd-bin'
_pkgname="${pkgname/-bin}"
pkgver=9.0.0
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
  '3561348c1f326087aeef55516e5eafd2ffe235d1ce48ebc9ecafb8d1bdb99550'
  'SKIP' 'SKIP' 'SKIP'
)
b2sums=(
  'b5ee51cf47a38b50dd9f3e98a8af401206c3ff74a7eb8d9ce415ee6aff193448bced0e9c9db500cb63688ae9e3e9676a7f0f4b803c407863f3a8164700909788'
  'SKIP' 'SKIP' 'SKIP'
)

# eof
