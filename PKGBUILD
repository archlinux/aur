# Contributor: Michael Gerdau <mgd@qata.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-excel-writer-xlsx'
pkgver='1.07'
pkgrel='2'
pkgdesc="Create a new file in the Excel 2007+ XLSX format."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-archive-zip>=1.3')
makedepends=()
url='https://metacpan.org/release/Excel-Writer-XLSX'
source=("http://search.cpan.org/CPAN/authors/id/J/JM/JMCNAMARA/Excel-Writer-XLSX-${pkgver}.tar.gz")
md5sums=('0dc0b1f1b4434ca80a9a924e638847c0')
sha512sums=('47dd7b8b3ff917177da01a277aa9231c678e1b29780815903de2856e39c47aa319c8ce1d1c0b96f6effdd936367bd17b612d04448b05c2707f5b215f3c9eb707')
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
