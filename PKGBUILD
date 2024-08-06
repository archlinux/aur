# Contributor: Trizen <echo dHJpemVuQHByb3Rvbm1haWwuY29tCg== | base64 -d>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-compression-util'
pkgver='0.10'
pkgrel='1'
pkgdesc="Compression::Util - implementation of various techniques used in data compression"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.36.0')
makedepends=()
url='https://metacpan.org/release/Compression-Util'
source=("https://cpan.metacpan.org/authors/id/T/TR/TRIZEN/Compression-Util-${pkgver}.tar.gz")
b2sums=('ae833d4f08e078722f880cd18d9b586843e9962a3d084417dda4ab10b9a6fc316aaf2663828bf2f5a8cd882ca4ea5188f063afc780c81cf1fa0163c622dbcafb')
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
