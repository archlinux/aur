# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-spreadsheet-xlsx'
pkgver='0.13'
pkgrel='1'
pkgdesc="Perl extension for reading MS Excel 2007 files;"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-archive-zip>=1.18' 'perl-spreadsheet-parseexcel')
makedepends=()
url='http://search.cpan.org/dist/Spreadsheet-XLSX'
source=('http://search.cpan.org/CPAN/authors/id/D/DM/DMOW/Spreadsheet-XLSX-0.13-withoutworldwriteables.tar.gz')
md5sums=('ce6835443558c24d3306482a49201853')
sha512sums=('519eb5636ffe87cc6589afc7930078c2a11b3a41cbe03a3c5b23d3225bee825f6e45ba1e8f4d889c6b14b4283f09a6926223e49f8ce6dd27bcf67eca659734da')
_distdir="Spreadsheet-XLSX-0.13"

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
