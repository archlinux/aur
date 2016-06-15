# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-math-gradient'
pkgver='0.04'
pkgrel='1'
pkgdesc="Perl extension for calculating gradients for colour transitions, etc."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='https://metacpan.org/release/Math-Gradient'
source=('http://search.cpan.org/CPAN/authors/id/C/CR/CRAKRJACK/Math-Gradient-0.04.tgz')
md5sums=('4324edf09a8f684153ac0079f8507a0b')
sha512sums=('84443d50bbfc51fe8d2314a1cbac158643845b5f9c948f6d5c8d9930cb920b8403211b5152a2aff6e5eb8fe5331656b9eee1304ee53de622967b8042f6d75aec')
_distdir="Math-Gradient-0.04"

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
