# Maintainer: Ludwig Stecher <ludwig.stecher@gmx.de>
# Contributor: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- mode: sh -*-

pkgname='pomsky-bin'
_pkgname=${pkgname%%-bin}
pkgver=0.11
pkgrel=2
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
  '96380dda2754c602c365252fcfad36d998e409d6fa2026dd917a55f6877cf867'
  SKIP SKIP SKIP SKIP
)
sha512sums=(
  '66cf73a06d884aaac51e2d7640275cab30d2d435a48ef95d4a5029cc76e5e8f031d943ed67370956f5388d695bd6bfb7138e945dd9a0e3a2e772d61c1468f76e'
  SKIP SKIP SKIP SKIP
)
b2sums=(
  'b29ba16f8bb70728f113d8e7c7b1cbec7c9816264d5c817193d6ac0ecc5559ef62d7685af3891468763b934c4e21cb5c8774834886d91a131a8605dcd7e16121'
  SKIP SKIP SKIP SKIP
)

# eof
