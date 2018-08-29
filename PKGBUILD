# Maintainer: Johannes Löthberg <johannes@kyriasis.com>

pkgname=perl-data-validate-ip
pkgver=0.27
pkgrel=2

pkgdesc='IPv4 and IPv6 validation methods'
license=('GPL' 'PerlArtistic')
arch=('any')
url="https://metacpan.org/release/Data-Validate-IP"

depends=(perl perl-netaddr-ip)

options=('!emptydirs' purge)

source=(http://search.cpan.org/CPAN/authors/id/D/DR/DROLSKY/Data-Validate-IP-$pkgver.tar.gz)

sha256sums=('e1aa92235dcb9c6fd9b6c8cda184d1af73537cc77f4f83a0f88207a8bfbfb7d6')

build() {
  cd Data-Validate-IP-"$pkgver"
  /usr/bin/perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd Data-Validate-IP-"$pkgver"
  make install DESTDIR="$pkgdir"
}
