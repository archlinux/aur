# Contributor: ordoban <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-test-env'
pkgver='1.088'
pkgrel='2'
pkgdesc="test the environment"
arch=('any')
license=('Artistic-1.0')
options=('!emptydirs')
depends=('perl>=5.008')
makedepends=()
url='https://metacpan.org/release/Test-Env'
source=("http://search.cpan.org/CPAN/authors/id/B/BR/BRIANDFOY/Test-Env-$pkgver.tar.gz")
md5sums=('8cf574a2f0093bd124bd692ceeff192c')
sha512sums=('eb7aed8d6ced395ba3c3e6f7b39741a111e4e6b41c95997f2a33942ce3913e23fb540e482833a56a2cac9dd91d2aa9904acc3a54aef31f2f5fa158ec92246918')
_distdir="Test-Env-$pkgver"

build() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                      \
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

  find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
