# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=perl6-debugger-ui-commandline
pkgver=0.0.1
pkgrel=6
pkgdesc="Command-line debugger frontend for Rakudo"
arch=('any')
depends=('perl6' 'perl6-terminal-ansicolor')
makedepends=('git')
groups=('perl6')
url="https://github.com/jnthn/rakudo-debugger"
license=('PerlArtistic')
source=($pkgname-$pkgver::git+https://github.com/jnthn/rakudo-debugger)
sha256sums=('SKIP')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing documentation...'
  install -Dm 644 README.markdown -t "$pkgdir/usr/share/doc/$pkgname"

  msg2 'Installing...'
  export RAKUDO_LOG_PRECOMP=1
  export RAKUDO_RERESOLVE_DEPENDENCIES=0
  perl6-install-dist \
    --to="$pkgdir/usr/share/perl6/vendor" \
    --for=vendor \
    --from=.
}
