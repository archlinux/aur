# Contributor: Michael Gerdau <mgd@qata.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-spreadsheet-parsexlsx'
pkgver='0.18'
pkgrel='1'
pkgdesc="parse XLSX files"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-archive-zip>=0' 'perl-graphics-colorutils>=0' 'perl-spreadsheet-parseexcel>=0.61' 'perl-xml-twig>=0' 'perl>=5.008')
makedepends=()
url='https://metacpan.org/release/Spreadsheet-ParseXLSX'
source=('http://search.cpan.org/CPAN/authors/id/D/DO/DOY/Spreadsheet-ParseXLSX-0.18.tar.gz')
md5sums=('3650e612dbb5b1432e087a10eaaa3f97')
sha512sums=('e5265e731d8c374fa2daea45e507d790c8699fc21e1f6eadbff6c00c5853223f012a6f03fb78f9a53bbdab2713bd6a4006e59393dbdca74cb871f19efee0f046')
_distdir="Spreadsheet-ParseXLSX-0.18"

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
