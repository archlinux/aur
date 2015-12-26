# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=perl6-grammar-debugger
pkgver=0.0.1
pkgrel=4
pkgdesc="Simple tracing and debugging support for Perl 6 grammars"
arch=('any')
depends=('rakudo' 'perl6-terminal-ansicolor')
checkdepends=('perl')
makedepends=('git')
groups=('perl6')
url="https://github.com/jnthn/grammar-debugger"
license=('PerlArtistic')
source=($pkgname-$pkgver::git+https://github.com/jnthn/grammar-debugger)
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
