# Maintainer: Ludwig Stecher <ludwig.stecher@gmx.de>
# Contributor: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- mode: sh -*-

pkgname='pomsky-bin'
_pkgname=${pkgname%%-bin}
pkgver=0.10
pkgrel=1
pkgdesc='A portable, modern regular expression language written in Rust (pre-compiled)'
arch=('x86_64')
url='https://pomsky-lang.org/'
_rawurl='https://raw.githubusercontent.com/pomsky-lang/pomsky/main'
license=(
  'Apache'
  'MIT'
)
source=(
  "https://github.com/pomsky-lang/${_pkgname}/releases/download/v$pkgver/pomsky_linux_v$pkgver"
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
  'c0b256ac904b995cf08819b97dee8779bd167186ed580e2395e30c5e4c5f54e0'
  SKIP SKIP SKIP SKIP
)
sha512sums=(
  '205e39dd76e22caab5675952c13498291e84931b30066413964b44de6106c14fde22906621512f364a1283de7a345aed3bdce212d2c113b22c0a8d12b7f557c3'
  SKIP SKIP SKIP SKIP
)
b2sums=(
  '5c73860e2708ba1e4cc27aa4d5260e1a4be099d212942d5a7b87208951ea6d1db6a7fb7970b8b19e2d86105d5499d6483cc80f1a405e741c8b43371bc46eb998'
  SKIP SKIP SKIP SKIP
)

# eof
