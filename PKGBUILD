# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=perl6-pod-to-html
pkgver=0.0.1
pkgrel=1
pkgdesc="Convert Perl 6 Pod to HTML"
arch=('any')
depends=('rakudo' 'perl6-uri')
checkdepends=('perl')
makedepends=('git')
url="https://github.com/perl6/Pod-To-HTML"
license=('MIT')
source=($pkgname-$pkgver::git+https://github.com/perl6/Pod-To-HTML)
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
