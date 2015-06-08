# CPAN Name  : Scalar-Does
# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-scalar-does'
pkgver='0.202'
pkgrel='1'
pkgdesc="like ref() but useful"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-exporter-tiny>=0.026' 'perl-type-tiny>=0.004' 'perl-uri>=0' 'perl-lexical-underscore>=0' 'perl-namespace-clean>=0.19')
makedepends=()
checkdepends=('perl-test-nowarnings>=0' 'perl-test-requires>=0.06')
url='http://search.cpan.org/dist/Scalar-Does'
source=('http://search.cpan.org/CPAN/authors/id/T/TO/TOBYINK/Scalar-Does-0.202.tar.gz')
md5sums=('d32eeaea9b9dcb5eb55d5b56eda753a3')
sha512sums=('e60550f9bbf7ccdf419dc77dcef8d149b6f0ef089b72a2bc5451bde98d6d590d9661919b90a68ebb9ac821dfabc4b29c24dd8b3fab05179fd9cc5f87205ee746')
_distdir="Scalar-Does-0.202"

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
