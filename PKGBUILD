# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=perl6-config-toml
pkgver=0.0.1
pkgrel=1
pkgdesc="TOML parser for Perl 6"
arch=('any')
depends=('rakudo')
checkdepends=('perl')
makedepends=('git')
url="https://github.com/atweiden/config-toml"
license=('UNLICENSE')
source=($pkgname-$pkgver::git+https://github.com/atweiden/config-toml)
sha256sums=('SKIP')

check() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Running tests...'
  prove -r -e perl6
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing...'
  mkdir -p "$pkgdir/usr/share/perl6/vendor/lib"
  find lib -mindepth 1 -maxdepth 1 -exec \
    cp -dpr --no-preserve=ownership '{}' "$pkgdir/usr/share/perl6/vendor/lib" \;
}
