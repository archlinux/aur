# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- mode: sh -*-

pkgname='tuc-bin'
_pkgname=${pkgname%%-bin}
pkgver=1.2.0
pkgrel=1
pkgdesc='A more powerful alternative to cut, when cut doesn’t cut it (pre-compiled)'
arch=('x86_64')
url='https://github.com/riquito/tuc'
_rawurl='https://github.com/riquito/tuc/raw/master'
license=('GPL3')
source=(
  "tuc-$pkgver::$url/releases/download/v$pkgver/tuc-linux-amd64"
  "$_rawurl/CHANGELOG.md"
  "$_rawurl/README.md"
  "$_rawurl/doc/tuc.1"
)
depends=('gcc-libs' 'glibc')
provides=("$_pkgname")
conflicts=("$_pkgname")

package() {
  cd "$srcdir"

  install -vDm0755 "tuc-$pkgver" "$pkgdir/usr/bin/tuc"

  for mdname in {CHANGELOG,README}.md; do
    install -Dm0644 "$mdname" "$pkgdir/usr/share/doc/$pkgname/$mdname"
  done

  install -Dm0644 tuc.1 "$pkgdir/usr/share/man/man1/tuc.1"
}

sha256sums=(
  '5ad1a9545b598040e9a51d82bb1acd7b41da550661135aeb82fbd9ce926908cb'
  'SKIP' 'SKIP' 'SKIP'
)
b2sums=(
  '2e608348d9187bed3a12e90dd46ffbb93c3f595ed924b291ea1f9d5b398a8732605fed82534850fa8cd5237dc16ed7c8987004d2718bbc6469bb1df9c65e3624'
  'SKIP' 'SKIP' 'SKIP'
)

# eof
