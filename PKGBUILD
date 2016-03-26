# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-tap-harness-archive'
pkgver='0.18'
pkgrel='1'
pkgdesc="Create an archive of TAP test results"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-yaml-tiny')
makedepends=()
url='https://metacpan.org/release/TAP-Harness-Archive'
source=('http://search.cpan.org/CPAN/authors/id/S/SC/SCHWIGON/TAP-Harness-Archive-0.18.tar.gz')
md5sums=('2cf535f3e795c1feb6f10d784809304e')
sha512sums=('87762e75aaaf8b166ca7fcddfff724c334fc8bca7ef505433151de0ee0dee320022070743a1bc1f3652e156e9a54d232d975f0cae95a5ae4362e8d3727713f06')
_distdir="TAP-Harness-Archive-0.18"

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
