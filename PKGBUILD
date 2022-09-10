# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# Contributor:  Ludwig Stecher <ludwig {dot} stecher {at} gmx {dot} de>
# -*- mode: sh -*-

pkgname='pomsky-bin'
_pkgname=${pkgname%%-bin}
pkgver=0.7
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
  'b15c3f4dea50272dff619bf6893513a44e5cebeab56665d5bdc8cc9797bb1a87'
  SKIP SKIP SKIP SKIP
)
sha512sums=(
  '4a0239d122506632e22e3861aa1f122f01416449130d59954c38b068c9c8c415fd455ab5130e209935e178943462ad07d3582ba88d7aaf9f44f9001ae7d6945f'
  SKIP SKIP SKIP SKIP
)
b2sums=(
  '3827209b971b037624c096c2c2902a1aabaf225c5ad2c642204e03a3f39ad3867ae2a0af3a8c7d0a0b8ae96e449ecc351c86a4d94e208cfa4f697d6bc789168c'
  SKIP SKIP SKIP SKIP
)

# eof
