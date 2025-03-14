# Maintainer: René Wagner <rwagner at rw-net dot de>
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-test-tcp'
pkgver='2.22'
pkgrel='2'
pkgdesc="testing TCP program"
arch=('any')
license=('GPL-1.0-only' 'Artistic-1.0')
options=('!emptydirs')
depends=('perl-test-sharedfork>=0.29' 'perl>=5.8.1')
makedepends=()
url='https://metacpan.org/release/Test-TCP'
source=('https://cpan.metacpan.org/authors/id/M/MI/MIYAGAWA/Test-TCP-2.22.tar.gz')
sha512sums=('2e0c8cf710f9702eee9b00422d7133efe87575805361d72becd2c3de671c765baf84827b601d26091e8a6b8595e6d9f168f90b7cfda402d668deb6fc277e37ad')
_distdir="Test-TCP-2.22"

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
