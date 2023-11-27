# Contributor: CpanBot <cpanbot at sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-devel-caller'
pkgver='2.07'
pkgrel='1'
pkgdesc="meatier versions of caller"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-padwalker>=0.08')
makedepends=()
url='https://metacpan.org/release/Devel-Caller'
source=('http://search.cpan.org/CPAN/authors/id/R/RC/RCLAMP/Devel-Caller-2.07.tar.gz')
md5sums=('29c5c2e4e46b508debf85525ac35c8e5')
sha512sums=('9c4bc1bfbd012c803ce7e0ec1c586558e6e4198ed19dac6608eb05939a74cfe2e6613942696451cfa1aad4f98f2acea6a2e43fa32b5d377787c00b560d7d8111')
_distdir="Devel-Caller-2.07"

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
