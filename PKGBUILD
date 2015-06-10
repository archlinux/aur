# Contributor: Michael Gerdau <mgd@qata.de>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-spreadsheet-parsexlsx'
pkgver='0.17'
pkgrel='1'
pkgdesc="parse XLSX files"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-archive-zip>=0' 'perl-graphics-colorutils>=0' 'perl-spreadsheet-parseexcel>=0.61' 'perl-xml-twig>=0')
makedepends=()
url='http://search.cpan.org/dist/Spreadsheet-ParseXLSX'
source=('http://search.cpan.org/CPAN/authors/id/D/DO/DOY/Spreadsheet-ParseXLSX-'${pkgver}'.tar.gz')
md5sums=('86887924266348100b50229037805c61')
sha512sums=('79d1dbe9de0a3b246511f4a6aa3a5b7e320733030db15aa87ad8a0d8bf3a993ff519d71d6347275fe79cb4b2fdf710c395d6a4f50b42ac23066a883fa5ce6a8a')
_distdir=('Spreadsheet-ParseXLSX-'${pkgver})

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
