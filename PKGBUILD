# Maintainer: Florian Pritz <bluewind@xinu.at>

pkgname=perl-log-any
pkgver=1.710
pkgrel=2
pkgdesc='Bringing loggers and listeners together'
arch=(any)
license=(PerlArtistic GPL)
options=(!emptydirs)
depends=(perl)
url=https://metacpan.org/release/Log-Any
source=("https://cpan.metacpan.org/authors/id/P/PR/PREACTION/Log-Any-$pkgver.tar.gz")
md5sums=(f0a9c5b9b81cc5fb842298d9b4b11779)
sha512sums=(1aff56c1c4c51d4e9aae43add704dd2da86ea320ee095a613bd569c2f0ea546c98d27a1e0854f9b88cc1772bf438ee3be80ba2f61e8c15f39497035993f122e3)
_ddir="Log-Any-$pkgver"

build()
(
  cd "$srcdir/$_ddir"
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  unset PERL5LIB PERL_MM_OPT
  /usr/bin/perl Makefile.PL
  make
)

check()
(
  cd "$srcdir/$_ddir"
  export PERL_MM_USE_DEFAULT=1
  unset PERL5LIB
  make test
)

package()
(
  cd "$srcdir/$_ddir"
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
)

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
