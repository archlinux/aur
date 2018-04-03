# Maintainer : int <int [ate] arcor [dot] de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-pdf-table'
pkgver='0.10.0'
pkgrel='1'
pkgdesc="Perl/CPAN Module PDF::Table: A utility class for building table layouts in a PDF::API2 object."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='https://metacpan.org/release/PDF-Table'
source=("http://search.cpan.org/CPAN/authors/id/O/OM/OMEGA/PDF-Table-$pkgver.tar.gz")
md5sums=('6e875b9a0ad4181005cb4ee16ee8d0b3')
sha512sums=('ca375ed6d7e2b342dfa030e2f27b46e76661909b29abfc29e11a099120849c007293c9e2189fe43f94e8f9992fa2e0d693e992d2d1b53bb884eaf3a97b6bfcee')
_distdir="PDF-Table-$pkgver"

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
