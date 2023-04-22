# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com>
# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-spreadsheet-xlsx'
pkgver='0.17'
pkgrel='1'
pkgdesc="Perl extension for reading MS Excel 2007 files;"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-archive-zip>=1.18' 'perl-spreadsheet-parseexcel>=0')
checkdepends=('perl-test-nowarnings>=0' 'perl-test-warnings>=0')
url="https://metacpan.org/release/Spreadsheet-XLSX"
source=("https://search.cpan.org/CPAN/authors/id/A/AS/ASB/Spreadsheet-XLSX-0.17.tar.gz")
sha512sums=('a59b7649cdc6a2cefc0bae7cc2f713611b1a5715895a4ca58dd374920fd876c34e5fae5b892c30fdc2a29c72c84f8bfe0e9d80405556bbeb050450e24d41d8ed')
_distdir="Spreadsheet-XLSX-${pkgver}"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB="" \
      PERL_AUTOINSTALL=--skipdeps \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='${pkgdir}'" \
      PERL_MB_OPT="--installdirs vendor --destdir '${pkgdir}'" \
      MODULEBUILDRC=/dev/null

    cd "${srcdir}/${_distdir}"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "${srcdir}/${_distdir}"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "${srcdir}/${_distdir}"
  make install
  find "${pkgdir}" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
