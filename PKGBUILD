# Maintainer : int <int [ate] arcor [dot] de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-pdf-reuse-barcode'
pkgver='0.07'
pkgrel='1'
pkgdesc="Perl/CPAN Module PDF::Reuse::Barcode: Create barcodes for PDF documents with PDF::Reuse"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-barcode-code128' 'perl-gd-barcode' 'perl-pdf-reuse')
makedepends=()
url='https://metacpan.org/release/PDF-Reuse-Barcode'
source=('http://search.cpan.org/CPAN/authors/id/C/CN/CNIGHS/PDF-Reuse-Barcode-0.07.tar.gz')
md5sums=('05bbc7a9d6eb8f1c187548ed5d4bb88a')
sha512sums=('e7bba6cad252dbd3ed550515d1fc3f56999df0071cd98ea97ae7a97ab3ea42b2fb749b589cd663461dbc7af145e249f2af8ea0f83b7caf0203c1c022d95c88ba')
_distdir="PDF-Reuse-Barcode-0.07"

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
  find "$pkgdir" "(" -name .packlist -o -name perllocal.pod ")" -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
