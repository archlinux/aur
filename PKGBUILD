# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=perl6-html-parser
pkgver=0.1
pkgrel=1
pkgdesc="Role for HTML parsing"
arch=('any')
depends=('rakudo' 'perl6-xml')
checkdepends=('perl')
makedepends=('git')
groups=('perl6')
url="https://github.com/tony-o/perl6-html-parser"
license=('PerlArtistic')
source=($pkgname-$pkgver::git+https://github.com/tony-o/perl6-html-parser)
sha256sums=('SKIP')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing documentation...'
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"

  msg2 'Installing...'
  mkdir -p "$pkgdir/usr/share/perl6/vendor/lib"
  find lib -mindepth 1 -maxdepth 1 -exec \
    cp -dpr --no-preserve=ownership '{}' "$pkgdir/usr/share/perl6/vendor/lib" \;
}
