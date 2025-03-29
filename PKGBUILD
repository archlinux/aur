# -*- sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname='docfd-bin'
_pkgname="${pkgname/-bin}"
pkgver=10.0.0
pkgrel=1
pkgdesc='TUI multiline fuzzy document finder (pre-compiled)'
arch=('x86_64')
url='https://github.com/darrenldl/docfd'
_rawurl='https://raw.githubusercontent.com/darrenldl/docfd/main'
license=('MIT')  # SPDX-License-Identifier: MIT
provides=("$_pkgname")
conflicts=("${provides[@]}")
_flavour='linux'
source=(
  "$url/releases/download/$pkgver/$_pkgname-$pkgver-$_flavour.tar.gz"
  "CHANGELOG-$pkgver.md::$_rawurl/CHANGELOG.md"
  "README-$pkgver.md::$_rawurl/README.md"
  "$_rawurl/LICENSE"
)
changelog="$pkgname.changelog"

package() {
  install -vsDm0755 -t "$pkgdir/usr/bin" \
    docfd

  for _doc in CHANGELOG README; do
    install -vDm0644 "$_doc-$pkgver.md" \
      "$pkgdir/usr/share/docs/$pkgname/$_doc.md"
  done

  install -vDm0644 -t "$pkgdir/usr/share/licenses/$pkgname" \
    LICENSE
}

sha256sums=(
  '8298959f312bc9396c4e9dbc2e63edc00f0d500297991e43373102db68daa40d'
  'SKIP' 'SKIP' 'SKIP'  # to my Lou!
)
b2sums=(
  '27d50e3676fa48bab93f9c2d1cdfb6aa77ea64b84120fb5849ac682af9645a4f4dbb4d9257475f2ce40ec2e54989c24a584a2b273acb8f2a8c20e7f18a78ce7c'
  'SKIP' 'SKIP' 'SKIP'
)

# eof
