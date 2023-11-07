# Contributor: CpanBot <cpanbot at sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-math-random-mt'
pkgver='1.17'
pkgrel='1'
pkgdesc="The Mersenne Twister PRNG"
arch=('i686' 'x86_64')
license=('BSD')
options=('!emptydirs')
depends=('perl>=0')
makedepends=()
checkdepends=('perl-test-number-delta>=0')
url='https://metacpan.org/release/Math-Random-MT'
source=('http://search.cpan.org/CPAN/authors/id/F/FA/FANGLY/Math-Random-MT-1.17.tar.gz')
md5sums=('97e431587e1a0ab805d211446d4ee089')
sha512sums=('46150ae8d1b7a0e24a2d962bb34c4075d9370ab3fe1237a0b44e506f22699bf1674a8299d1c4b708b441d45a29ca1943d0beeb9759c5c832df288d490f1ac889')
_distdir="Math-Random-MT-1.17"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$srcdir/$_distdir"
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
