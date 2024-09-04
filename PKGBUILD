# -*- sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname='docfd-bin'
_pkgname="${pkgname/-bin}"
pkgver=8.0.2
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
  '9c2739420972a4bb09d73e5c08a1827f2653ccd236f2f3ae0658e0d1f2be652f'
  'SKIP' 'SKIP' 'SKIP'
)
b2sums=(
  '119411223e167ed1cd18b130c2638534087a5086992909cc45d6421862fd1ed7bee3d4dac11de730f9750c0a6900829ca5d1d44a2fb3f15cce707a7f07d10ef3'
  'SKIP' 'SKIP' 'SKIP'
)

# eof
