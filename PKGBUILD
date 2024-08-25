# Contributor: Trizen <echo dHJpemVuQHByb3Rvbm1haWwuY29tCg== | base64 -d>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-compression-util'
pkgver='0.13'
pkgrel='1'
pkgdesc="Compression::Util - implementation of various techniques used in data compression"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.36.0')
makedepends=()
url='https://metacpan.org/release/Compression-Util'
source=("https://cpan.metacpan.org/authors/id/T/TR/TRIZEN/Compression-Util-${pkgver}.tar.gz")
b2sums=('8915c2cbe3dd40c3bc269b3ee42263aa733bcebae80f54a11e666476a29a8162c68414e773871739f3ff8c3a690f4d5f5576489a1f8e14bf5e5f9e41d3f3163c')
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
