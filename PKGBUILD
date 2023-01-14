# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# Contributor:  Ludwig Stecher <ludwig {dot} stecher {at} gmx {dot} de>
# -*- mode: sh -*-

pkgname='pomsky-bin'
_pkgname=${pkgname%%-bin}
pkgver=0.9
pkgrel=1
pkgdesc='A portable, modern regular expression language written in Rust (pre-compiled)'
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
  '6ccece1e505382dc5e57dd73f8b5ca90002c9cc0ede5c31bf76b601685c9e932'
  SKIP SKIP SKIP SKIP
)
sha512sums=(
  'e8426c79a2270bc07ed7acba31bf04a9fe787b73d0583baea823262b3d91669a998ac76207636933fe18e881ee96a31749a4a84947a9f27a5c799e879b352dd5'
  SKIP SKIP SKIP SKIP
)
b2sums=(
  'acdbdca7f8755921ba88d7bbd3a5e991e23bbc2ac5ae6f0bc721d4b339b4057e584dd0fce53c0f390093d77e2a9aa493bcd91b420bbe417ed404ec6b571846af'
  SKIP SKIP SKIP SKIP
)

# eof
