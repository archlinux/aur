# -*- mode: sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

_pkgname=icann-rdap
pkgname="$_pkgname-bin"
pkgver=0.0.21
pkgrel=1
#epoch=
pkgdesc='ICANN implementation of the Registry Data Access Protocol (RDAP) [re-compiled]'
arch=('x86_64')
url="https://github.com/icann/$_pkgname"
_rawurl="https://raw.githubusercontent.com/icann/$_pkgname/refs/heads/main"
license=('Apache-2.0 OR MIT')  # SPDX-License-Identifier: Apache-2.0 OR MIT
#groups=()
depends=('gcc-libs' 'glibc')
#makedepends=()
#checkdepends=()
#optdepends=()
provides=('rdap' "$_pkgname")
conflicts=('rdap'{,-client} "$_pkgname")
#replaces=()
#backup=()
#options=()
#install=
#changelog=
source=(
  "$_pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$_pkgname-$CARCH-unknown-linux-gnu.tar.gz"
  "$_rawurl/LICENSE-APACHE"
  "$_rawurl/LICENSE-MIT"
  "README-$pkgver.md::$_rawurl/README.md"
)
#noextract=()
#validpgpkeys=()

package() {
  # Binaries
  install -vDm0755 -t "$pkgdir/usr/bin" \
    rdap{,-srv{,-{data,store,test-data}},-test}

  # Docs (READMEs)
  install -vDm0644 "README-$pkgver.md" \
    "$pkgdir/usr/share/doc/$pkgname/README.md"

  # Licenses (only the MIT license is actually required here)
  install -vDm0644 -t "$pkgdir/usr/share/licenses/$pkgname" \
    LICENSE-*
}

sha256sums=(
  '00d074ca3c96cc0ca1a804e936cdc13a0b492bd3867da511ad361f04aeea932e'
  'SKIP' 'SKIP' 'SKIP'  # (to my Lou)
)

# eof
