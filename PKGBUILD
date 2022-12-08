# Maintainer: FantasqueX <fantasquex at gmail dot com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: fnord0 <fnord0 AT riseup DOT net>

pkgname=dnsenum2
pkgver=1.3.1
pkgrel=2
pkgdesc="Enumerate DNS information from a domain and discover non-contiguous ip blocks"
url='https://github.com/SparrowOchon/dnsenum2'
arch=('any')
license=('GPL')
depends=('perl' 'perl-net-dns' 'perl-net-ip' 'perl-net-netmask' 'perl-string-random')
optdepends=(
  'perl-net-whois-ip: whois queries support'
  'perl-html-parser: google scraping support'
  'perl-www-mechanize: google scraping support'
  'perl-xml-writer: xml output support'
)
conflicts=('dnsenum')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/SparrowOchon/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz)
sha512sums=('26cec4056ae787ee297868e58ca384946e1edb80be36b0a92beca846a8abb9be21963295cb2cc3349d9ec765b30b308f3721347d24208481c35dce371c32db97')

build() {
  cd ${pkgname}-${pkgver}
  make
}

package() {
  cd ${pkgname}-${pkgver}
  INSTALL_DEPS=0 DESTDIR=${pkgdir} make install
}

# vim: ts=2 sw=2 et:
