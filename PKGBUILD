# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-test-tcp'
pkgver='2.11'
pkgrel='1'
pkgdesc="testing TCP program"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-test-sharedfork>=0.29' 'perl')
makedepends=()
url='https://metacpan.org/release/Test-TCP'
source=('http://search.cpan.org/CPAN/authors/id/K/KA/KAZUHO/Test-TCP-2.11.tar.gz')
md5sums=('f36949c5368861b79616a6d6ac7f3852')
sha512sums=('778e9777c0166ac85d94e39f96a17f8a1d68eb0a59f94e0c8d39085bd243e8c63f43d2ee2486515da02f36bced4886ae4caf57e109c84c5603e640172b3eee8c')
_distdir="Test-TCP-2.11"

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
