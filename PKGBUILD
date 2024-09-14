# -*- sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname='docfd-bin'
_pkgname="${pkgname/-bin}"
pkgver=8.0.3
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
  'dac1daad46be512dfc32eb6c4de728a105ed8954cbd655c23dbbdb57a6061177'
  'SKIP' 'SKIP' 'SKIP'
)
b2sums=(
  'e25691e6cbaf6a4992a9fbdfc7e5d70614c888fd85a745b650e58404224aadebb5909786fa1bf135ca1ce6246c433c477b65173301ba2d2662dac01ca125d5db'
  'SKIP' 'SKIP' 'SKIP'
)

# eof
