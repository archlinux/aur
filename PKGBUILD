# Contributor: Trizen <echo dHJpemVuQHByb3Rvbm1haWwuY29tCg== | base64 -d>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-compression-util'
pkgver='0.12'
pkgrel='1'
pkgdesc="Compression::Util - implementation of various techniques used in data compression"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.36.0')
makedepends=()
url='https://metacpan.org/release/Compression-Util'
source=("https://cpan.metacpan.org/authors/id/T/TR/TRIZEN/Compression-Util-${pkgver}.tar.gz")
b2sums=('b7fd9013b50f1e59b528592f51db74ad6b5f2a229065b13b856402e993676d78307bdd34c11a262e439d6f58d2759a8c685627969a70f6d84db4a6b9276b6ff9')
_distdir="Compression-Util-${pkgver}"

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
