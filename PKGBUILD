# Maintainer: éclairevoyant

_dist=Test-Future-IO-Impl
pkgname=perl-test-future-io-impl
pkgver=0.14
pkgrel=1
pkgdesc="Future-returning IO methods"
arch=(any)
license=(PerlArtistic GPL)
options=('!emptydirs')
depends=(perl)
makedepends=(perl-module-build)
checkdepends=(perl-test2-suite)
url="https://metacpan.org/release/$_dist"
source=("https://cpan.metacpan.org/authors/id/P/PE/PEVANS/$_dist-$pkgver.tar.gz")
b2sums=('701235a6ad922f237f6d8c051ac5ff71064617b07dc0488f787894064ff7293222fb79c7452213f7dc8f2340ee6c45e732bef72369a2fe9203c94b153b83396d')

build() {
  cd $_dist-$pkgver
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 MODULEBUILDRC=/dev/null
  /usr/bin/perl Build.PL
  ./Build
}

check() {
  cd $_dist-$pkgver
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  ./Build test
}

package() {
  cd $_dist-$pkgver
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  ./Build install --installdirs=vendor --destdir="$pkgdir"
}
