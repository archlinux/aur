# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-string-toidentifier-en'
pkgver='0.10'
pkgrel='1'
pkgdesc="Convert Strings to English Program Identifiers"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-lingua-en-inflect-phrase' 'perl-namespace-clean' 'perl-text-unidecode')
makedepends=()
url='http://search.cpan.org/dist/String-ToIdentifier-EN'
source=('http://search.cpan.org/CPAN/authors/id/R/RK/RKITOVER/String-ToIdentifier-EN-0.10.tar.gz')
md5sums=('98258828c02f5140eda5d8383e139f1e')
sha512sums=('45139373100c10121f0ee13b3c4ed79783165bfbbc8794582f89515c31f6da0cf7bb58cf00f603ac19838e74e9b3eb4570baad8b31a25a15fb598c4d9694e435')
_distdir="String-ToIdentifier-EN-0.10"

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
