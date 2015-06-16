# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-moosex-attributehelpers'
pkgver='0.23'
pkgrel='1'
pkgdesc="Extend your attribute interfaces (deprecated)"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-moose>=0.56')
makedepends=('perl-moose' 'perl-test-exception>=0.21')
url='http://search.cpan.org/dist/MooseX-AttributeHelpers'
source=('http://search.cpan.org/CPAN/authors/id/D/DR/DROLSKY/MooseX-AttributeHelpers-0.23.tar.gz')
md5sums=('ebdd543a211884854b6c87adf25e6e22')
sha512sums=('57ec98e98172d761538aa475f2c6e8ef59c6430d121cd283642670d938a774211a5a55bb14a8a493f22a1a6edafa25d5bea7eb31c0dc4731d00f55b32bde87dc')
_distdir="MooseX-AttributeHelpers-0.23"

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
