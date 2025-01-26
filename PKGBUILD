# Maintainer: Florian Pritz <bluewind@archlinux.org>

pkgname=perl-function-parameters
pkgver=2.002005
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
md5sums=('207124613068af76732a3c1f7afb8e47')
sha512sums=('97528791291378f9be226a0f7182dd182966019b37d668983ee9b3d911a61011c40356441465cb9482e6bcb403d7214d84506751fabcf0a0ed9bd55fe5fd1bfe')
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
