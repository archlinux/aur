# CPAN Name  : Scalar-Does
# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-scalar-does'
pkgver='0.203'
pkgrel='1'
pkgdesc="like ref() but useful"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-exporter-tiny>=0.026' 'perl-type-tiny>=0.004' 'perl-uri>=0' 'perl-lexical-underscore>=0' 'perl-namespace-clean>=0.19')
makedepends=()
checkdepends=('perl-test-nowarnings>=0' 'perl-test-requires>=0.06')
url='http://search.cpan.org/dist/Scalar-Does'
source=("https://search.cpan.org/CPAN/authors/id/T/TO/TOBYINK/Scalar-Does-$pkgver.tar.gz")
md5sums=('9f423b7735f65d2b9ba6611f1fb36043')
sha512sums=('698c5678c54f730dee96568853ba3e62c9bad4ae6157a134c0465d49068afdac039b3ab8319eba6f0c2c0634bfb7a58464a46bd1e8f2bf759d340dc2620d8419')
_distdir="Scalar-Does-$pkgver"

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
