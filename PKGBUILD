# Maintainer : int <int [ate] arcor [dot] de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-pdf-table'
pkgver='0.12'
pkgrel='1'
pkgdesc="Perl/CPAN Module PDF::Table: A utility class for building table layouts in a PDF::API2 object."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.01')
makedepends=()
url='https://metacpan.org/release/PDF-Table'
source=("http://search.cpan.org/CPAN/authors/id/O/OM/OMEGA/PDF-Table-$pkgver.tar.gz")
md5sums=('d9104e8de49b20cf86751ab833e81c3b')
sha512sums=('4fa453283f452638b3c1d152f1cc4436c43cb5d95a343431d6a4569cd1cdd439e7c82e7fd27ce1b466ae6487297922a3010450ee42c4217f1e18bbb8498c09be')
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
