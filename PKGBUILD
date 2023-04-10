# Maintainer: Florian Pritz <bluewind@xinu.at>

pkgname=perl-function-parameters
pkgver=2.002002
pkgrel=1
pkgdesc='define functions and methods with parameter lists ("subroutine signatures")'
arch=(x86_64)
license=(PerlArtistic GPL)
options=(!emptydirs)
depends=('perl>=5.14.0')
makedepends=('perl-extutils-makemaker>=7.0')
checkdepends=(perl-test-fatal)
url=https://metacpan.org/release/Function-Parameters
source=("https://cpan.metacpan.org/authors/id/M/MA/MAUKE/Function-Parameters-$pkgver.tar.gz")
md5sums=(4f9e49db1b855b0d2e73f1ca59d55df9)
sha512sums=(ca629f940899dde0a233958fb9b63877d5dc26d0d73628fb8eccda4f8720f4c8cbeff0edddad2436560caca2869e28a5df913776b1ce950da376892351ada96e)
_ddir="Function-Parameters-$pkgver"

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
