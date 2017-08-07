# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=perl6-html-parser
pkgver=0.1
pkgrel=3
pkgdesc="Role for HTML parsing"
arch=('any')
depends=('perl6' 'perl6-xml')
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
  export RAKUDO_LOG_PRECOMP=1
  export RAKUDO_RERESOLVE_DEPENDENCIES=0
  perl6-install-dist \
    --to="$pkgdir/usr/share/perl6/vendor" \
    --for=vendor \
    --from=.
}
