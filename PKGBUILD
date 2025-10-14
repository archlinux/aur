# Contributor: Michael Gerdau <mgd@qata.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-excel-writer-xlsx'
pkgver='1.15'
pkgrel='3'
pkgdesc="Create a new file in the Excel 2007+ XLSX format."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-archive-zip>=1.3')
makedepends=()
url='https://metacpan.org/release/Excel-Writer-XLSX'
source=('http://search.cpan.org/CPAN/authors/id/J/JM/JMCNAMARA/Excel-Writer-XLSX-1.15.tar.gz')
md5sums=('7f69ac42fa6a4aa0a55f9641d7f07273')
sha512sums=('0c23740802f281b3657ab7b4f78c17861176e608a630d0add173caf5b50faf1b6222705e492ffb0845d88faac973f93d84618d44c73456f16227f2582438cf12')
_distdir="Excel-Writer-XLSX-${pkgver}"

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
