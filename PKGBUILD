# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-string-toidentifier-en'
pkgver='0.12'
pkgrel='1'
pkgdesc="Convert Strings to English Program Identifiers"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-lingua-en-inflect-phrase' 'perl-namespace-clean' 'perl-text-unidecode')
url='https://search.cpan.org/dist/String-ToIdentifier-EN'
source=('https://search.cpan.org/CPAN/authors/id/R/RK/RKITOVER/String-ToIdentifier-EN-0.12.tar.gz')
md5sums=('2088d00f01974911fa6f8ee169ef80de')
_distdir="String-ToIdentifier-EN-0.12"

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
