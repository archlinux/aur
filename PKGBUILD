# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-devel-argnames'
pkgver='0.03'
pkgrel='1'
pkgdesc="Figure out the names of variables passed into subroutines."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-padwalker')
makedepends=('perl-test-use-ok')
url='http://search.cpan.org/dist/Devel-ArgNames'
source=('http://search.cpan.org/CPAN/authors/id/N/NU/NUFFIN/Devel-ArgNames-0.03.tar.gz')
md5sums=('052c96b835db0794f47e6f263b803143')
sha512sums=('490d0ebcc703001e0ca394721ae1528c78e4d13da7a1508ab4a22415edc18e1f4ebc070dae66183bee23fdb7650767c00d7e16ab1e497fbfc3bc477cbe59804f')
_distdir="Devel-ArgNames-0.03"

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
