pkgname=perl-data-validate-ip
pkgver=0.31
pkgrel=1

pkgdesc='IPv4 and IPv6 validation methods'
license=('GPL' 'PerlArtistic')
arch=('any')
url="https://metacpan.org/release/Data-Validate-IP"

depends=(perl perl-netaddr-ip)

options=('!emptydirs' purge)

source=(https://search.cpan.org/CPAN/authors/id/D/DR/DROLSKY/Data-Validate-IP-$pkgver.tar.gz)

sha256sums=('734aff86b6f9cad40e1c4da81f28faf18e0802c76a566d95e5613d4318182fc1')

build() {
  cd Data-Validate-IP-"$pkgver"
  /usr/bin/perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd Data-Validate-IP-"$pkgver"
  make install DESTDIR="$pkgdir"
}
