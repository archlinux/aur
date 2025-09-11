# -*- mode: sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

_pkgname='tuc'
pkgname="$_pkgname-bin"
pkgver=1.3.0
pkgrel=1
pkgdesc="A more powerful alternative to cut, when cut doesn't cut it (pre-compiled)"
arch=('x86_64')
url='https://github.com/riquito/tuc'
_rawurl='https://github.com/riquito/tuc/raw/master'
license=('GPL-3.0-or-later')  # SPDX-License-Identifier: GPL-3.0-or-later
source=(
  "tuc-$pkgver::$url/releases/download/v$pkgver/tuc-ubuntu-amd64"
  "CHANGELOG-$pkgver.md::$_rawurl/CHANGELOG.md"
  "README-$pkgver.md::$_rawurl/README.md"
  "tuc-$pkgver.1::$_rawurl/doc/tuc.1"
)
_skip=('SKIP' 'SKIP' 'SKIP')
depends=('gcc-libs' 'glibc')
provides=("$_pkgname")
conflicts=("${provides[@]}")

package() {
  cd "$srcdir"

  install -vDm0755 "tuc-$pkgver" "$pkgdir/usr/bin/tuc"

  for _mdname in CHANGELOG README; do
    install -vDm0644 "$_mdname-$pkgver.md" "$pkgdir/usr/share/doc/$pkgname/$_mdname.md"
  done

  install -vDm0644 "tuc-$pkgver.1" "$pkgdir/usr/share/man/man1/tuc.1"
}

sha256sums=(
  '229d6e9ae90a190010ad4a5dc1038e82daca38bfab9d3d7e324d9d68b4e4449e'
  "${_skip[@]}"
)
b2sums=(
  'd4a61ac19a3f92096272c990fabffd65e34082f64b602a428c939483f207570d85c59280c1f461728c38615c360e96cded83f795cb605e3405b7e3968bb27f1a'
  "${_skip[@]}"
)

# eof
