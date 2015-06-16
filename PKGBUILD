# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-perlio-via-timeout'
pkgver='0.29'
pkgrel='1'
pkgdesc="a PerlIO layer that adds read & write timeout to a handle"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-time-out')
makedepends=('perl-module-build-tiny>=0.030')
checkdepends=('perl-test-tcp')
url='http://search.mcpan.org/dist/PerlIO-via-Timeout'
source=('http://search.mcpan.org/CPAN/authors/id/D/DA/DAMS/PerlIO-via-Timeout-0.29.tar.gz')
md5sums=('5d11a404ef25fde310e1798c8702ce61')
sha512sums=('824e99209e8c0ff93b3cff97139f27170a3034c98866a34b9dd80d6a938cfaa8db39ab5dacc20bd87aa94b0411f100b8744ac3f00672049d23d2324430b77f7c')
_distdir="PerlIO-via-Timeout-0.29"

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
