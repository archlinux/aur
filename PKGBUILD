# Generator  : CPANPLUS::Dist::Arch 1.32
# Maintainer: András Wacha < awacha at gmail >

pkgname='perl-spreadsheet-writeexcel'
pkgver='2.40'
pkgrel='1'
pkgdesc="Write to a cross-platform Excel binary file."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-ole-storage-lite>=0.19' 'perl-parse-recdescent>=0')
makedepends=()
url='https://metacpan.org/release/Spreadsheet-WriteExcel'
source=('http://search.cpan.org/CPAN/authors/id/J/JM/JMCNAMARA/Spreadsheet-WriteExcel-2.40.tar.gz')
md5sums=('b3262290e96985ee12d81c861a389790')
sha512sums=('aa6690b4b7b66620e6490f97b0d82520dbe2a51cdc0fd03c9f83bf963f609c39e5f9f45c31e0a68809d0ba8f8ea3120c7c53cddd48a875074d5dd8250d19574e')
_distdir="Spreadsheet-WriteExcel-2.40"

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
