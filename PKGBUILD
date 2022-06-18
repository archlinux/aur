# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- mode: sh -*-

pkgname='rulex-rs-bin'
_pkgname=${pkgname%%-bin}
_exename=${_pkgname%%-rs}
pkgver=0.4.2
pkgrel=1
pkgdesc='A new, portable, regular expression language written in Rust'
arch=('x86_64')
url='https://rulex-rs.github.io/'
_rawurl='https://raw.githubusercontent.com/rulex-rs/rulex/main'
license=(
  'Apache'
  'MIT'
)
source=(
  "https://github.com/rulex-rs/rulex/releases/download/v$pkgver/rulex_linux_v$pkgver"
  "$_rawurl/CHANGELOG.md"
  "$_rawurl/LICENSE-APACHE"
  "$_rawurl/LICENSE-MIT"
  "$_rawurl/README.md"
)
provides=("$_pkgname")
conflicts=("$_pkgname")

package() {
  cd "$srcdir" || exit 1

  install -Dm0755 "rulex_linux_v$pkgver" "$pkgdir/usr/bin/$_exename"

  for mdname in {CHANGELOG,README}.md; do
    install -Dm0644 "$mdname" "$pkgdir/usr/share/doc/$pkgname/$mdname"
  done

  for license in LICENSE-{APACHE,MIT}; do
    install -Dm0644 "$license" "$pkgdir/usr/share/licenses/$pkgname/$license"
  done
}

sha256sums=(
  'a6b855202b4b6f75147809aba668f1626d4312fab106bd53fd7b838fd07516b6'
  'SKIP' 'SKIP' 'SKIP' 'SKIP'
)
sha512sums=(
  '506f71250172c7a87b709678ebe841ad735a047dfef5dab21da6dc9292d2dee3dcc7ab8b5da62ce1d46a079cf62194433d4c178b7bd57ed0d67c4dfed591b4e6'
  'SKIP' 'SKIP' 'SKIP' 'SKIP'
)
b2sums=(
  '1290f89fe8364bb31b5a6899361f9754b580e90b7bd220ce10107f2960a51951cb81b87217ff271ad6624ca03c3cce7cd575309cb3a153a49b1f1b91c8f59cc3'
  'SKIP' 'SKIP' 'SKIP' 'SKIP'
)

# eof
