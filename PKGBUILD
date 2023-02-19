# Maintainer: Florian Pritz <bluewind@xinu.at>

pkgname=perl-function-parameters
pkgver=2.001005
pkgrel=1
pkgdesc='define functions and methods with parameter lists ("subroutine signatures")'
arch=(x86_64)
license=(PerlArtistic GPL)
options=(!emptydirs)
depends=('perl>=5.14.0')
checkdepends=(perl-test-fatal)
url=https://metacpan.org/release/Function-Parameters
source=("https://cpan.metacpan.org/authors/id/M/MA/MAUKE/Function-Parameters-$pkgver.tar.gz")
md5sums=(288935f5883cff32a5ea235832508ef4)
sha512sums=(96962e03f85ed0d2d1c6cbb781118724a905a31bb531b8fb94634183042ae8f069269af565b9be592771be5a1e06ffb855bbb7b8171faf27f1bb470771b7687d)
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
