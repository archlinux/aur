# Maintainer: Florian Pritz <bluewind@archlinux.org>

pkgname=perl-function-parameters
pkgver=2.002004
pkgrel=2
pkgdesc='define functions and methods with parameter lists ("subroutine signatures")'
arch=(x86_64)
license=(PerlArtistic GPL)
options=(!emptydirs)
depends=('perl>=5.14.0')
makedepends=('perl-extutils-makemaker>=7.0')
checkdepends=(perl-test-fatal)
url=https://metacpan.org/release/Function-Parameters
source=("https://cpan.metacpan.org/authors/id/M/MA/MAUKE/Function-Parameters-$pkgver.tar.gz")
md5sums=(eedaa26261c106a2000c9a1266a2d321)
sha512sums=(2df10b3e7ad87c26a0bfec88a88602b5960f1c59a494d480eb24cee96be89d1b89036d3ad7f6f2f4bda25531cb5693c139578a3b2efaca1b38b3cea9f050fa9e)
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
