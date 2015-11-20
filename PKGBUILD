# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=perl6-digest-xxhash
pkgver=0.0.1
pkgrel=3
pkgdesc="Perl 6 bindings for xxHash"
arch=('any')
depends=('libxxhash' 'rakudo')
checkdepends=('perl')
makedepends=('git')
groups=('perl6')
url="https://github.com/atweiden/digest-xxhash"
license=('UNLICENSE')
source=($pkgname-$pkgver::git+https://github.com/atweiden/digest-xxhash)
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
