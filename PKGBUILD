# Contributor: chimeracoder <dev@chimeracoder.net>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-log-dispatch-array'
pkgver='1.005'
pkgrel='1'
pkgdesc="log events to an array (reference)"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-log-dispatch>=0')
makedepends=()
checkdepends=('perl-test-deep>=0' 'perl-namespace-autoclean' 'perl-specio' 'perl-eval-closure' 'perl-params-validationcompiler' )
url='http://search.cpan.org/dist/Log-Dispatch-Array'
source=("http://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/Log-Dispatch-Array-$pkgver.tar.gz")
md5sums=('ba5371862efa974c27ba42b93761d8ea')
sha512sums=('35d632ae0d2b8c34f132884c606b7e2ec12ad3e763ebc043a53449c0a63da03adf661ae2aa45f1b95d50f39a662f472e37f013ada727fbe53242c7d5d361e87e')
_distdir="Log-Dispatch-Array-$pkgver"

build() {
   export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Makefile.PL
    make
  
}

check() {
  cd "$srcdir/$_distdir"
   export PERL_MM_USE_DEFAULT=1 PERL5LIB="."
    make test
  
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
