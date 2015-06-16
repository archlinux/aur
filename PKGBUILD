# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-www-ipinfo'
pkgver='0.05'
pkgrel='1'
pkgdesc="Returns your ip address and geolocation data using http://ipinfo.io"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-json')
makedepends=()
checkdepends=('perl-test-requiresinternet>=0.03')
url='http://search.mcpan.org/dist/WWW-ipinfo'
source=('http://search.mcpan.org/CPAN/authors/id/S/SI/SILLYMOOS/WWW-ipinfo-0.05.tar.gz')
md5sums=('e23df9a7bc02863813e69a0993da050b')
sha512sums=('115754dc78cf9bfc09d270500c06c253c2d1f4186b10413cd4ed3bd75030b1bc952d36d18ab5acc30287fceaa3206b1b90bf9850ef727acb9c15115f39f08535')
_distdir="WWW-ipinfo-0.05"

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
