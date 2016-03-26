# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-uri-fetch'
pkgver='0.11'
pkgrel='1'
pkgdesc="Smart URI fetching/caching"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-errorhandler' 'perl-uri' 'perl-libwww')
makedepends=()
url='https://metacpan.org/release/URI-Fetch'
source=('http://search.cpan.org/CPAN/authors/id/N/NE/NEILB/URI-Fetch-0.11.tar.gz')
md5sums=('28f1ed3ffce1f01787ba82ce0f53a4be')
sha512sums=('34adec1cbb698ec0901d37aee45ecfea72351e5af8d65e3bf94833731e53f1cf47cfd4d310baf0e8f1f84edfe671a155039af91e332446cea146dcc8a8c86eb9')
_distdir="URI-Fetch-0.11"

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
