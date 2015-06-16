# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-io-socket-timeout'
pkgver='0.27'
pkgrel='1'
pkgdesc="IO::Socket with read/write timeout"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-perlio-via-timeout>=0.28')
makedepends=('perl-module-build-tiny>=0.036')
checkdepends=('perl-test-tcp')
url='http://search.mcpan.org/dist/IO-Socket-Timeout'
source=('http://search.mcpan.org/CPAN/authors/id/D/DA/DAMS/IO-Socket-Timeout-0.27.tar.gz')
md5sums=('2e22f5f17b5a8e99f9647ebb120af8cd')
sha512sums=('bd8c7e428fbf5e0a1f35a14acd5f3281d6fa7a84f1d6eb4c07712aa3c2601635fc832433f72c5470d60828ac774fc9f148649c0bc1ac20f0d93bab1c487114a9')
_distdir="IO-Socket-Timeout-0.27"

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
