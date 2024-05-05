# Maintainer: int <int [ate] arcor [dot] de>
# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-string-toidentifier-en'
pkgver='0.12'
pkgrel='1'
pkgdesc="Perl/CPAN Module String::ToIdentifier::EN: Convert Strings to English Program Identifiers"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.8.1' 'perl-lingua-en-inflect-phrase' 'perl-text-unidecode' 'perl-namespace-clean')
makedepends=()
url='https://metacpan.org/release/String-ToIdentifier-EN'
source=("https://search.cpan.org/CPAN/authors/id/R/RK/RKITOVER/String-ToIdentifier-EN-${pkgver}.tar.gz")
md5sums=('2088d00f01974911fa6f8ee169ef80de')
sha512sums=('1fac41b16d284dacb81412d6f22171d795272f53d18bfe3b048af9bcc11b6844515fb27a389abfabcd18ffd3e6c5cf6905d5e2440a6cd38ef0ea8eda549a43c4')
_distdir="String-ToIdentifier-EN-${pkgver}"

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

  find "$pkgdir" "(" -name .packlist -o -name perllocal.pod ")" -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:

