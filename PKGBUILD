# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-text-csv-simple'
pkgver='1.00'
pkgrel='1'
pkgdesc="Simpler parsing of CSV files"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-trigger' 'perl-file-slurp' 'perl-text-csv-xs')
makedepends=()
url='http://search.cpan.org/dist/Text-CSV-Simple'
source=('http://search.cpan.org/CPAN/authors/id/T/TM/TMTM/Text-CSV-Simple-1.00.tar.gz')
md5sums=('03eaf9232c84716e8a70ea1dcd9edfb2')
sha512sums=('3b4779d06183a66fb2502eaabf506e10b7d08ebe16d20682e651f04ede50719b88cc1c43ad52300b5b2f28fc2f9870d05c80069cc37988b555933dd09e5e0245')
_distdir="Text-CSV-Simple-1.00"

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
