# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# Contributor:  Ludwig Stecher <ludwig {dot} stecher {at} gmx {dot} de>
# -*- mode: sh -*-

pkgname='pomsky-bin'
_pkgname=${pkgname%%-bin}
pkgver=0.8
pkgrel=1
pkgdesc='Formerly rulex — a portable, modern regular expression language written in Rust (pre-compiled)'
arch=('x86_64')
url='https://pomsky-lang.org/'
_rawurl='https://raw.githubusercontent.com/rulex-rs/pomsky/main'
license=(
  'Apache'
  'MIT'
)
source=(
  "https://github.com/rulex-rs/${_pkgname}/releases/download/v$pkgver/pomsky_linux_v$pkgver"
  "$_rawurl/CHANGELOG.md"
  "$_rawurl/LICENSE-APACHE"
  "$_rawurl/LICENSE-MIT"
  "$_rawurl/README.md"
)
provides=("$_pkgname")
conflicts=("$_pkgname" 'rulex-rs-bin')

package() {
  cd "$srcdir" || exit 1

  install -Dm0755 "pomsky_linux_v$pkgver" "$pkgdir/usr/bin/$_pkgname"

  for mdname in {CHANGELOG,README}.md; do
    install -Dm0644 "$mdname" "$pkgdir/usr/share/doc/$pkgname/$mdname"
  done

  for license in LICENSE-{APACHE,MIT}; do
    install -Dm0644 "$license" "$pkgdir/usr/share/licenses/$pkgname/$license"
  done
}

sha256sums=(
  '8bb55d028a25d279bbdb2817b7cf70b04a1c563ec1ef5807bb28968fe84964c0'
  SKIP SKIP SKIP SKIP
)
sha512sums=(
  'e7c8afc57684185938529bff622760cb70fcf5556cb69f4e268f7df9aa024bd6cfdccbb2a8c841cffcb1411e15b10dd83208a225b7f3defd8bde931f558dbd68'
  SKIP SKIP SKIP SKIP
)
b2sums=(
  'a6f1d25414cfb7e83be4a4029c5c104e3b3a8dbcf199f0608d6798907a1a6a90030bd80365dc1bb1a8995cd6ba18ad82507a2d1311c734300faa6399faef7cad'
  SKIP SKIP SKIP SKIP
)

# eof
