# Maintainer: Florian Pritz <bluewind@archlinux.org>

pkgname=perl-log-any
pkgver=1.717
pkgrel=1
pkgdesc='Bringing loggers and listeners together'
arch=(any)
license=(PerlArtistic GPL)
options=(!emptydirs)
depends=(perl)
checkdepends=(perl-devel-stacktrace)
url=https://metacpan.org/release/Log-Any
source=("https://cpan.metacpan.org/authors/id/P/PR/PREACTION/Log-Any-$pkgver.tar.gz")
md5sums=(516bceca5af5b3f07e81278e54ec6ffa)
sha512sums=(feabda26eefebd7fe63ba63750b11e00f217778f0fa801adf3b52342400155230b620b3f2b08630e4b472a328a6c13a84294d35c52968f2fc1206b61fee0d20e)
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
