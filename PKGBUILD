# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# Contributor:  Ludwig Stecher <ludwig {dot} stecher {at} gmx {dot} de>
# -*- mode: sh -*-

pkgname='pomsky-bin'
_pkgname=${pkgname%%-bin}
pkgver=0.5
pkgrel=2
pkgdesc='Formerly rulex — a new, portable, regular expression language written in Rust (pre-compiled)'
arch=('x86_64')
url='https://pomsky-lang.org/'
_rawurl='https://raw.githubusercontent.com/rulex-rs/rulex/main'
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
  'cfa4ebd637489edb127e61c24fad4ad9ed489805dd245093594346c197eea9e2'
  SKIP SKIP SKIP SKIP
)
sha512sums=(
  'd10e05aad578cb0232d3dbcdbcdbe4d0822d198657f8b64ee2a192be5da7e2bebee0782a7748231b5e8f39ba065a53b70d23497d7f9a481b5e2823b8284e287b'
  SKIP SKIP SKIP SKIP
)
b2sums=(
  'bd3010a5628dcaa22b2c0b168a6b903cc1c5ea103b07a682a7f19e32824499cdd49cd9793708400e914226df883ba9ac456afb4652d4c8d4918f7d1739aa8801'
  SKIP SKIP SKIP SKIP
)

# eof
