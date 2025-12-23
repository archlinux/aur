# Contributor: loserMcloser <reebydobalina@gmail.com>
pkgname=perl-xs-parse-sublike
pkgver=0.41
pkgrel=1
pkgdesc='XS functions to assist in parsing C<sub>-like syntax'
_dist=XS-Parse-Sublike
arch=('x86_64' 'i686')
url="https://metacpan.org/release/$_dist"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-file-sharedir')
makedepends=('perl-module-build')
options=('!emptydirs' 'purge')
source=("https://cpan.metacpan.org/authors/id/P/PE/PEVANS/$_dist-$pkgver.tar.gz")
sha512sums=('dc30cecbf32fccea12b4c0205781fb3db16007d7b3cea1cec0375750658a16a62cfcf618cbca301c48145987baa0a64418d578fbc120968d70f3af29e3aba4fb')

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

