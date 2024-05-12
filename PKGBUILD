# Contributor: Trizen <echo dHJpemVuQHByb3Rvbm1haWwuY29tCg== | base64 -d>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-compression-util'
pkgver='0.07'
pkgrel='1'
pkgdesc="Compression::Util - implementation of various techniques used in data compression"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.36.0')
makedepends=()
url='https://metacpan.org/release/Compression-Util'
source=("https://cpan.metacpan.org/authors/id/T/TR/TRIZEN/Compression-Util-${pkgver}.tar.gz")
b2sums=('7d27c5baee48db234fdd0743d928a7636ee744f67c083eec47fb6528eb8085895614f2e2649f251eaf119eeaa8fa61b931c9f31154fda81aa2bb1295b96d3296')
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
