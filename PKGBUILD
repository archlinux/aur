# Maintainer: Florian Pritz <bluewind@archlinux.org>

pkgname=perl-function-parameters
pkgver=2.002003
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
md5sums=(9a7c9b273707d7fb567ae54f001f34ad)
sha512sums=(5b25462fc55f15ecaabb2e448de605f46c4fe3eccdff2449e86b43bcec23f231b75b39255ef8be3f103b32645aa0c19631391a33055934398dd0bac667eb496b)
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
