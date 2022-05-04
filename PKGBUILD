# Maintainer : int <int [ate] arcor [dot] de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-pdf-table'
pkgver='1.002'
pkgrel='1'
pkgdesc="Perl/CPAN Module PDF::Table: A utility class for building table layouts in a PDF::API2 object."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.010')
makedepends=()
url='https://metacpan.org/release/PDF-Table'
source=("http://search.cpan.org/CPAN/authors/id/O/OM/OMEGA/PDF-Table-$pkgver.tar.gz")
md5sums=('0e250efea356ae28515c8ef801955108')
sha512sums=('45630dbb43ed9745b0c0a84ba605c021c46141c8fd61b8546b12333e2477843f4eb3ce7ce976ce4e66fed1f60d39acbdf28ae60bea7ade49bd9ceefdf483384a')
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
