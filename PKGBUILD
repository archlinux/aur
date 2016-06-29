# Contributor: Michael Gerdau <mgd@qata.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-spreadsheet-parsexlsx'
pkgver='0.24'
pkgrel='1'
pkgdesc="parse XLSX files"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-archive-zip>=0' 'perl-cryptx>=0' 'perl-graphics-colorutils>=0' 'perl-ole-storage-lite>=0' 'perl-spreadsheet-parseexcel>=0.61' 'perl-xml-twig>=0' 'perl>=5.008')
makedepends=()
url='https://metacpan.org/release/Spreadsheet-ParseXLSX'
source=('http://search.cpan.org/CPAN/authors/id/D/DO/DOY/Spreadsheet-ParseXLSX-0.24.tar.gz')
md5sums=('1a1338913771bd3691df7290445c7e3b')
sha512sums=('c6183c7efed9e148ce663fe3b3dbafc4e7f0d9553bc596f665a12c05960f0a508a04bb7ebc6b680dc85b746215aafe2ed51de7014e7f89282c5aa8a26d008215')
_distdir="Spreadsheet-ParseXLSX-0.24"

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
