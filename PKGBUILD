# Contributor: Michael Gerdau <mgd@qata.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-spreadsheet-parsexlsx'
pkgver='0.29'
pkgrel='1'
pkgdesc="parse XLSX files"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-archive-zip>=0' 'perl-cryptx>=0' 'perl-graphics-colorutils>=0' 'perl-ole-storage-lite>=0' 'perl-spreadsheet-parseexcel>=0.61' 'perl-xml-twig>=0' 'perl>=5.010')
makedepends=()
url='https://metacpan.org/release/Spreadsheet-ParseXLSX'
source=('https://cpan.metacpan.org/authors/id/N/NU/NUDDLEGG/Spreadsheet-ParseXLSX-0.29.tar.gz')
#source=('http://search.cpan.org/CPAN/authors/id/D/DO/DOY/Spreadsheet-ParseXLSX-0.29.tar.gz')
md5sums=('6278b358ede2188610c40ec5ea7439d7')
sha512sums=('f30ee22f00811ddfac0166c7e79e26fdcbdabbe6ee9482319f55d087e7ac5a88130611d9f6fb94db7b7bf35df999437f537e67003452a2a66aecaf1d7f7f4c34')
_distdir="Spreadsheet-ParseXLSX-0.29"

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
