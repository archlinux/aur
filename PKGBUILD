# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=perl6-debugger-ui-commandline
pkgver=0.0.1
pkgrel=3
pkgdesc="Command-line debugger frontend for Rakudo"
arch=('any')
depends=('rakudo' 'perl6-terminal-ansicolor')
makedepends=('git')
groups=('perl6')
url="https://github.com/jnthn/rakudo-debugger"
license=('PerlArtistic')
source=($pkgname-$pkgver::git+https://github.com/jnthn/rakudo-debugger)
sha256sums=('SKIP')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing...'
  mkdir -p "$pkgdir/usr/share/perl6/vendor/lib"
  find lib -mindepth 1 -maxdepth 1 -exec \
    cp -dpr --no-preserve=ownership '{}' "$pkgdir/usr/share/perl6/vendor/lib" \;

  msg2 'Cleaning up precomp dir...'
  rm -rf "$pkgdir/usr/share/perl6/vendor/lib/.precomp"
}
