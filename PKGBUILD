# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# Contributor:  Ludwig Stecher <ludwig {dot} stecher {at} gmx {dot} de>
# -*- mode: sh -*-

pkgname='pomsky-bin'
_pkgname=${pkgname%%-bin}
pkgver=0.6
pkgrel=1
pkgdesc='Formerly rulex — a new, portable, regular expression language written in Rust (pre-compiled)'
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
  '76db59b1457d9d2bc69f0bf7d6be8c3f1cff82596dd9cb986620a53ba8feeef0'
  SKIP SKIP SKIP SKIP
)
sha512sums=(
  'ad8a3c50df3c4da36902d29fd84adae154f0ad3c82b89e9fc33d3f3ebac2e65a9f15a430172c5d608cc8c09e7150be2b83af857fa4da2e24fbbefdc90891e8af'
  SKIP SKIP SKIP SKIP
)
b2sums=(
  '1e2bac1c7f5a0b79ec4a6028358849cefb6e4bf7a610c6441b7200c4858add6202b6cb67d288f90d12ef2a6f0a40c15e0f89deba8c4b8b408aee5c783cf6bf93'
  SKIP SKIP SKIP SKIP
)

# eof
