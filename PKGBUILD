# Maintainer: Brian Bidulock <bidulock@Openss7.org>
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname=perl-log-dispatch
pkgver=2.70
pkgrel=1
pkgdesc="Dispatches messages to one or more outputs"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-devel-globaldestruction' 'perl-dist-checkconflicts>=0.02' 'perl-ipc-run3' 'perl-module-runtime' 'perl-params-validate>=1.03' 'perl>=5.006')
makedepends=()
checkdepends=('perl-test-fatal' 'perl-test-needs' 'perl-specio' 'perl-namespace-autoclean'
              'perl-eval-closure' 'perl-params-validationcompiler')
url='https://metacpan.org/release/Log-Dispatch'
source=("http://search.cpan.org/CPAN/authors/id/D/DR/DROLSKY/Log-Dispatch-${pkgver}.tar.gz")
md5sums=('3369ffd45dc098ef6c74622ceee7ad74')
sha512sums=('c4c8cfb9e74b3176d5f95e3f9fbc86303321caa3e608a7ec318786ecd80d2238fd06a3b74ded65d5d3fab5c3a1297f99c92c62b1136b27d3b5396fd3fca602f6')
_distdir="Log-Dispatch-${pkgver}"

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
  rm -fr "$pkgdir/usr/lib"
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
