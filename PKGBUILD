# Contributor: Michael Gerdau <mgd@qata.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-excel-writer-xlsx'
pkgver='0.88'
pkgrel='1'
pkgdesc="Create a new file in the Excel 2007+ XLSX format."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-archive-zip>=1.3')
makedepends=()
url='https://metacpan.org/release/Excel-Writer-XLSX'
source=('http://search.cpan.org/CPAN/authors/id/J/JM/JMCNAMARA/Excel-Writer-XLSX-0.88.tar.gz')
md5sums=('2b35ada3039e9ae3f4e6b61e39e8c155')
sha512sums=('af840e596a8a7183e2326677d782c4ae578efb058ffb948e6d7b78e94faf8285734f3225d8507fe258e55a615157d7de8ee8db3ca96f8e3e3186238804e71891')
_distdir="Excel-Writer-XLSX-0.88"

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
