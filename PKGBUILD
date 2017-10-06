# Maintainer : int <int [ate] arcor [dot] de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-pdf-table'
pkgver='0.9.12'
pkgrel='1'
pkgdesc="Perl/CPAN Module PDF::Table: A utility class for building table layouts in a PDF::API2 object."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='https://metacpan.org/release/PDF-Table'
source=('http://search.cpan.org/CPAN/authors/id/O/OM/OMEGA/PDF-Table-0.9.12.tar.gz')
md5sums=('17ed82bb9ed5939eb7b807d7af6e4e85')
sha512sums=('03d781ece07d73a7b6fc41db1f8ffb07a50b0566dfdb34a6e7e77459f7461386f78b318dcafa0fe714c05ac30075bbd73135c19a209e5c32169c1132819eed80')
_distdir="PDF-Table-0.9.12"

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
