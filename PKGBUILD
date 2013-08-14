# Maintainer: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>

_perlmod=Env-Path
pkgname=perl-env-path
pkgver=0.19
pkgrel=1
pkgdesc="Perl module Env::Path - Advanced operations on path variables"
arch=(any)
license=('GPL' 'PerlArtistic')
url="http://search.cpan.org/~dsb/$_perlmod-$pkgver"
options=(!emptydirs)
depends=('perl')
source=("http://search.cpan.org/CPAN/authors/id/D/DS/DSB/$_perlmod-$pkgver.tar.gz")
sha1sums=('0c4677e6d6e03a0bfaab877ac74bce55a519f49c')

build() {
  cd "$srcdir/$_perlmod-$pkgver"

  # install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd "$srcdir/$_perlmod-$pkgver"
  make DESTDIR="$pkgdir" install
}

check() {
  cd "$srcdir/$_perlmod-$pkgver"
  make test
}

# vim:set ts=2 sw=2 et:
