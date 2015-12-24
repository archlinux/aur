# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=perl6-json-tiny
pkgver=0.0.1
pkgrel=3
pkgdesc="A tiny JSON parser and emitter for Perl 6 on Rakudo"
arch=('any')
depends=('rakudo')
checkdepends=('perl')
makedepends=('git')
groups=('perl6')
url="https://github.com/moritz/json"
license=('PerlArtistic')
source=($pkgname-$pkgver::git+https://github.com/moritz/json)
sha256sums=('SKIP')

check() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Running tests...'
  PERL6LIB=lib prove -r -e perl6
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing...'
  mkdir -p "$pkgdir/usr/share/perl6/vendor/lib"
  find lib -mindepth 1 -maxdepth 1 -exec \
    cp -dpr --no-preserve=ownership '{}' "$pkgdir/usr/share/perl6/vendor/lib" \;
}
