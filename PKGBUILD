# Contributor: Michael Gerdau <mgd@qata.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-spreadsheet-parsexlsx'
pkgver='0.31'
pkgrel='1'
pkgdesc="parse XLSX files"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-archive-zip>=0' 'perl-cryptx>=0' 'perl-graphics-colorutils>=0' 'perl-ole-storage-lite>=0' 'perl-spreadsheet-parseexcel>=0.61' 'perl-xml-twig>=0' 'perl>=5.010')
makedepends=()
url='https://metacpan.org/release/Spreadsheet-ParseXLSX'
source=('https://cpan.metacpan.org/authors/id/N/NU/NUDDLEGG/Spreadsheet-ParseXLSX-0.31.tar.gz')
#source=('http://search.cpan.org/CPAN/authors/id/D/DO/DOY/Spreadsheet-ParseXLSX-0.31.tar.gz')
md5sums=('a5bee9c64d93d6918c98bcf1dc4eb7f2')
sha512sums=('1e30893dec13c5a25fc2d620aad117fc3d0a24a216d1811c88eda86ee4df6068d753af81a1d6bacf9dfbaeb0014080f9aa067f0c5963c1f6f3c5ae2e1a4c7ab7')
_distdir="Spreadsheet-ParseXLSX-0.31"

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
