# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-class-c3-adopt-next'
pkgver='0.13'
pkgrel='1'
pkgdesc="make NEXT suck less"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-list-moreutils' 'perl-mro-compat')
makedepends=('perl-test-exception>=0.27')
url='http://search.cpan.org/dist/Class-C3-Adopt-NEXT'
source=('http://search.cpan.org/CPAN/authors/id/F/FL/FLORA/Class-C3-Adopt-NEXT-0.13.tar.gz')
md5sums=('4b4a59b5004ab7e715315e3131773e04')
sha512sums=('9a31e489a5451d12a63e88b370c88ec4cccda66d5554841fcc2e4dfa3cb476bc2a6a943772d34f1781342e961029bd0187e9ce5a356711e81d1522560d049c6a')
_distdir="Class-C3-Adopt-NEXT-0.13"

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
