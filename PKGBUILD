# Contributor: Michael Gerdau <mgd@qata.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-excel-writer-xlsx'
pkgver='0.91'
pkgrel='1'
pkgdesc="Create a new file in the Excel 2007+ XLSX format."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-archive-zip>=1.3')
makedepends=()
url='https://metacpan.org/release/Excel-Writer-XLSX'
source=('http://search.cpan.org/CPAN/authors/id/J/JM/JMCNAMARA/Excel-Writer-XLSX-0.91.tar.gz')
md5sums=('af5db8fc6dbed85d98a28b811cb6f814')
sha512sums=('bc35b346a8792ba608c8266771eedbe20b3ca2bd785eb2110b9cf17132534e80f87db7434ed1165bfdb6b38ec1a385681906234cf46ccd550a4c01249c5b2058')
_distdir="Excel-Writer-XLSX-0.91"

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
