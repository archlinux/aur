# Maintainer : int <int [ate] arcor [dot] de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-pdf-table'
pkgver='1.003'
pkgrel='1'
pkgdesc="Perl/CPAN Module PDF::Table: A utility class for building table layouts in a PDF::API2 object."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.010')
makedepends=()
url='https://metacpan.org/release/PDF-Table'
source=("http://search.cpan.org/CPAN/authors/id/O/OM/OMEGA/PDF-Table-$pkgver.tar.gz")
md5sums=('d0a5b72a58684c263ae9d4de354b5c25')
sha512sums=('9d6bd0b58854b130b7ce9c0248251735eee2c4d72cd76db9121e7306451d8f36d453da068a5d47cb68b8dc7683b89e4f03e49879be456fee9898d2c34b8e2e6a')
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
