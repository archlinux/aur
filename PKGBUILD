# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- mode: sh -*-

pkgname='tuc-bin'
_pkgname=${pkgname%%-bin}
pkgver=1.0.0
pkgrel=1
pkgdesc='A more powerful alternative to cut, when cut doesn’t cut it (pre-compiled)'
arch=('x86_64')
url='https://github.com/riquito/tuc'
_rawurl='https://github.com/riquito/tuc/raw/master'
license=('GPL3')
source=(
  "tuc-$pkgver::$url/releases/download/v$pkgver/tuc-ubuntu-amd64"
  "$_rawurl/CHANGELOG.md"
  "$_rawurl/README.md"
  "$_rawurl/doc/tuc.1"
)
depends=('gcc-libs')
provides=("$_pkgname")
conflicts=("$_pkgname")

package() {
  cd "$srcdir" || exit 1

  install -Dm0755 "tuc-$pkgver" "$pkgdir/usr/bin/tuc"

  for mdname in {CHANGELOG,README}.md; do
    install -Dm0644 "$mdname" "$pkgdir/usr/share/doc/$pkgname/$mdname"
  done

  install -Dm0644 tuc.1 "$pkgdir/usr/share/man/man1/tuc.1"
}

sha256sums=(
  '1502c3bf5c142e70879548b257868e7dcdbd865e1af4f26558109a34fad08320'
  'SKIP' 'SKIP' 'SKIP'
)
sha512sums=(
  '7830a9e8b2f5c745aac74629ff031555dce0ff326c4f49f993f80ec31c116324566b6494996fbd6209b2e35060e53d97b91f527e135cc5d0a1121520d243c2e9'
  'SKIP' 'SKIP' 'SKIP'
)
b2sums=(
  '99538b3ba755195b3c3d25ce6223099178e9f9135ff1d5e7417a3cdf3d1c9ea7ab70c4988726059911bf5de92439888f6aa6cf5ad28e2a691d73418c996bbf63'
  'SKIP' 'SKIP' 'SKIP'
)

# eof
