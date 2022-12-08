# Maintainer: FantasqueX < fantasquex at gmail dot com >
pkgname=perl-net-whois-ip
pkgver=1.19
pkgrel=1
pkgdesc="Perl extension for looking up the whois information for ip addresses"
_dist=Net-Whois-IP
arch=(any)
url="https://metacpan.org/pod/Net::Whois::IP"
license=('unknown')
depends=(perl)
makedepends=(perl-regexp-ipv6)
source=("https://cpan.metacpan.org/authors/id/B/BS/BSCHMITZ/$_dist-$pkgver.tar.gz")
sha256sums=('f09bdfa0f1d2665b534826b5f3a8662349930eed2998efe4d8dbf98813147222')

build() {
  cd $_dist-$pkgver
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  perl Makefile.PL
  make
}

check() {
  cd $_dist-$pkgver
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd $_dist-$pkgver
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}
