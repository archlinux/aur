# Maintainer: FantasqueX <fantasquex at gmail dot com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: fnord0 <fnord0 AT riseup DOT net>

pkgname=dnsenum2
pkgver=1.3.2
pkgrel=1
pkgdesc="Enumerate DNS information from a domain and discover non-contiguous ip blocks"
url='https://github.com/SparrowOchon/dnsenum2'
arch=('any')
license=('GPL-2.0-or-later')
depends=('perl' 'perl-net-dns' 'perl-net-ip' 'perl-net-netmask' 'perl-string-random')
optdepends=(
  'perl-net-whois-ip: whois queries support'
  'perl-html-parser: google scraping support'
  'perl-www-mechanize: google scraping support'
  'perl-xml-writer: xml output support'
)
conflicts=('dnsenum')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/SparrowOchon/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz)
sha512sums=('47915d3a61223898aa50b7d96993ac6dce26027e1ab6ed4f373d7e4df7e293583657f0c030fde00f6ec34e04a0d83a505abbcb0dbbf4db27cb29676cb3979156')

build() {
  cd ${pkgname}-${pkgver}
  make
}

package() {
  cd ${pkgname}-${pkgver}
  INSTALL_DEPS=0 DESTDIR=${pkgdir} make install
}

# vim: ts=2 sw=2 et:
