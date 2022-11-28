# Maintainer: éclairevoyant
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname=perl-future-io
pkgver=0.11
pkgrel=2
pkgdesc="Future-returning IO methods"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-future' 'perl-struct-dumb' 'perl>=5.010')
makedepends=('perl-module-build')
checkdepends=('perl-test-identity' 'perl-test-pod')
url='https://metacpan.org/release/Future-IO'
source=('http://search.cpan.org/CPAN/authors/id/P/PE/PEVANS/Future-IO-0.11.tar.gz')
sha512sums=('8ee111cc1f0a0bfba84005de3e3bf0dadedf8be635f0a0a3b8423702db35fa1f76f7a0d47e32f5ed91163943d5acc788827e87233e11d0a4125a8f1d192c9a22')
_distdir="Future-IO-0.11"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Build.PL
    /usr/bin/perl Build
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    /usr/bin/perl Build test
  )
}

package() {
  cd "$srcdir/$_distdir"
  /usr/bin/perl Build install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
