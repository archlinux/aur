# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- mode: sh -*-

pkgname='rulex-rs-bin'
_pkgname=${pkgname%%-bin}
_exename=${_pkgname%%-rs}
pkgver=0.4.3
pkgrel=2
pkgdesc='A new, portable, regular expression language written in Rust (pre-compiled)'
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
  'c3849caa2fca9d69bb786704b3c7d7c3d18f29d2d987da6038f8d91dbdbb5033'
  'SKIP' 'SKIP' 'SKIP' 'SKIP'
)
sha512sums=(
  '6451bb0f0ee5f3aca7c94446a4a9c8868a59cf0cda3724289de41adcd01a51b0d7096ab955217596731fae09fd8dc01fcd0a1f22926fd4fcce1c9ae0ec43eee9'
  'SKIP' 'SKIP' 'SKIP' 'SKIP'
)
b2sums=(
  'f5bb3056f0bc8dcbb9ed3560061ecf81a8da58284d40557e1bf35d4e021eb49baccc0dd5bca1d73ea7d814c76588e7831c95b5b28b359b3df99064f011f6d7ea'
  'SKIP' 'SKIP' 'SKIP' 'SKIP'
)

# eof
