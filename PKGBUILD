# Contributor: Michael Gerdau <mgd@qata.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-spreadsheet-parsexlsx'
pkgver='0.36'
pkgrel='1'
pkgdesc="parse XLSX files"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-archive-zip>=1.34' 'perl-cryptx>=0' 'perl-graphics-colorutils>=0' 'perl-ole-storage-lite>=0' 'perl-spreadsheet-parseexcel>=0' 'perl-xml-twig>=0' 'perl>=5.010')
makedepends=()
url='https://metacpan.org/release/Spreadsheet-ParseXLSX'
source=('http://search.cpan.org/CPAN/authors/id/N/NU/NUDDLEGG/Spreadsheet-ParseXLSX-0.36.tar.gz')
md5sums=('41ee9438720f7ed57bbe2e288c0a58d9')
sha512sums=('359062b92000b5efd072b92e39c4be5334681f4af9291e0d0a0dc25c9419d3fe49e8ea06b27258017c49a193be272aa3ac2dabc58d22446cfca18dc4d5dffa71')
_distdir="Spreadsheet-ParseXLSX-0.36"

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
