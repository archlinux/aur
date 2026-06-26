# Contributor: Michael Gerdau <mgd@qata.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-spreadsheet-parsexlsx'
pkgver='0.37'
pkgrel='2'
pkgdesc="parse XLSX files"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-archive-zip>=1.34' 'perl-cryptx>=0' 'perl-graphics-colorutils>=0' 'perl-ole-storage-lite>=0' 'perl-spreadsheet-parseexcel>=0' 'perl-xml-twig>=0' 'perl>=5.010')
makedepends=()
url='https://metacpan.org/release/Spreadsheet-ParseXLSX'
source=('https://cpan.metacpan.org/authors/id/N/NU/NUDDLEGG/Spreadsheet-ParseXLSX-0.37.tar.gz')
md5sums=('be898f0d795cacc883258d03c292a4ef')
sha512sums=('1d39edc7b8c1d0bd820d9971743dce7de01448a38f83c6fbbc4c5d22d0a4b396fab8374ef4f43ac08163e4d9a83db97da11551cc2d96d070bc326a77141f01b7')
_distdir="Spreadsheet-ParseXLSX-0.37"

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
