# Maintainer: Strykar <strykar@hotmail.com>

pkgname=perl-object-result
_pkgver=0.000003
pkgver=0.03
pkgrel=1
pkgdesc="A module for handling results with exception-like behavior"
_dist=Object-Result
arch=('any')
url="https://metacpan.org/pod/Object::Result"
license=('Artistic-2.0')
depends=('perl' 'perl-try-tiny' 'perl-exporter-tiny' 'perl-role-tiny')
makedepends=('perl-module-build')
source=("https://cpan.metacpan.org/authors/id/D/DC/DCONWAY/${_dist}-${_pkgver}.tar.gz")
sha256sums=('01ce06fcf30dd062e42c2ab1917535d7649fe5088f28850ae14fe3ef3a6cb9be')
options=('!emptydirs' 'purge')

build() {
  cd $_dist-$_pkgver
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
}

package() {
  cd $_dist-$_pkgver
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}
