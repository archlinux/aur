# Maintainer: Strykar <strykar@hotmail.com>

pkgname=perl-pod-usage
pkgver=2.05
pkgrel=1
pkgdesc='Perl module for displaying usage messages for Perl scripts'
url="https://metacpan.org/pod/Pod::Usage"
license=('Artistic-1.0-Perl')
depends=('perl')
makedepends=('perl-module-build')
arch=('any')
source=("https://cpan.metacpan.org/authors/id/M/MA/MAREKR/Pod-Usage-${pkgver}.tar.gz")
sha256sums=('100c27908757c56ebfeca8b7bf15a9867e449df663ff013de3855d183dfbea30')
options=('!emptydirs' 'purge')

build() {
  cd "Pod-Usage-${pkgver}"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "Pod-Usage-${pkgver}"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd "Pod-Usage-${pkgver}"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}
