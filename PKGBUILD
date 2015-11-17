# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=perl6-uri
pkgver=0.1.1
pkgrel=2
pkgdesc="A URI implementation using Perl 6 grammars to implement RFC 3986 BNF"
arch=('any')
depends=('rakudo')
checkdepends=('perl')
makedepends=('git')
groups=('perl6')
url="https://github.com/perl6-community-modules/uri"
license=('PerlArtistic')
source=($pkgname-$pkgver::git+https://github.com/perl6-community-modules/uri)
sha256sums=('SKIP')

check() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Running tests...'
  prove -r -l lib -e perl6
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing...'
  mkdir -p "$pkgdir/usr/share/perl6/vendor/lib"
  find lib -mindepth 1 -maxdepth 1 -exec \
    cp -dpr --no-preserve=ownership '{}' "$pkgdir/usr/share/perl6/vendor/lib" \;
}
