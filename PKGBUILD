# Contributor: Michael Gerdau <mgd@qata.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-spreadsheet-parsexlsx'
pkgver='0.27'
pkgrel='1'
pkgdesc="parse XLSX files"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-archive-zip>=0' 'perl-cryptx>=0' 'perl-graphics-colorutils>=0' 'perl-ole-storage-lite>=0' 'perl-spreadsheet-parseexcel>=0.61' 'perl-xml-twig>=0' 'perl>=5.010')
makedepends=()
url='https://metacpan.org/release/Spreadsheet-ParseXLSX'
source=('http://search.cpan.org/CPAN/authors/id/D/DO/DOY/Spreadsheet-ParseXLSX-0.27.tar.gz')
md5sums=('d7ce39130e9969e6e1dc42461a138261')
sha512sums=('435a97bb965ead28a6bd34d4b76240ef3941124b38068a9eec56aa0e9e621aa30b70eb22ef5982059c69af6df2538fdb7939803945e007f6675219ecafefa041')
_distdir="Spreadsheet-ParseXLSX-0.27"

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
