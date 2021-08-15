# Maintainer: René Wagner < rwagner at rw-net dot de>
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-uri-fetch'
pkgver='0.15'
pkgrel='1'
pkgdesc="Smart URI fetching/caching"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-errorhandler' 'perl-uri' 'perl-libwww')
makedepends=('perl-test-requiresinternet')
url='https://metacpan.org/release/URI-Fetch'
source=("http://search.cpan.org/CPAN/authors/id/N/NE/NEILB/URI-Fetch-${pkgver}.tar.gz")
sha256sums=('379f39f24c6dae5c536332b17979fd90799dabccdfe8e792e7eead3eb8cda50c')
_distdir="URI-Fetch-${pkgver}"

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
