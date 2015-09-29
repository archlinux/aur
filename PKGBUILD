# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-perlio-via-timeout'
pkgver='0.32'
pkgrel='1'
pkgdesc="a PerlIO layer that adds read & write timeout to a handle"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=('perl-module-build-tiny>=0.039')
checkdepends=('perl-test-tcp')
url='https://metacpan.org/release/PerlIO-via-Timeout'
source=('http://search.cpan.org/CPAN/authors/id/D/DA/DAMS/PerlIO-via-Timeout-0.32.tar.gz')
md5sums=('f18328a39a5eaa386e34df80f066039b')
sha512sums=('52200c0d19da7a19b9b328473b0e7b57a1a3102fd3ace947af8fef8f670aaebe37811daaa2e2b6cf2f6397855a4cfb2424af053322146a8acefd71e1bb30f681')
_distdir="PerlIO-via-Timeout-0.32"

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
