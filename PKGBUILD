# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-flow'
pkgver='0.9'
pkgrel='1'
pkgdesc="Make data flow processing easy"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-json>=2.21' 'perl-xml-flow>=0.85')
makedepends=()
url='http://search.cpan.org/dist/Flow'
source=('http://search.cpan.org/CPAN/authors/id/Z/ZA/ZAG/Flow-0.9.tar.gz')
md5sums=('c8d7fb9c1b55f5091e2b272904452c98')
sha512sums=('926569c0d67753460d41fef854e0bf245f01027ad88cc94074e61ecf110932c5343365d562029f20b28f0962a3029f59de832b743194715570400aaeed19b6bd')
_distdir="Flow-0.9"

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
