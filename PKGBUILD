# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-io-socket-timeout'
pkgver='0.32'
pkgrel='1'
pkgdesc="IO::Socket with read/write timeout"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-perlio-via-timeout>=0.32')
makedepends=('perl-module-build-tiny>=0.039')
checkdepends=('perl-test-tcp')
url='https://metacpan.org/release/IO-Socket-Timeout'
source=('http://search.cpan.org/CPAN/authors/id/D/DA/DAMS/IO-Socket-Timeout-0.32.tar.gz')
md5sums=('93d978bb7f8360a215b646cf339b4559')
sha512sums=('013ad036c796880ab464b18f642260609095cf40c74f3127abaf3c8a596ba8ee85746129dc84d2d1e6f1bbfc86d75969e99c5a9b67736fa3e5e8bc7f5ddf83a6')
_distdir="IO-Socket-Timeout-0.32"

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
