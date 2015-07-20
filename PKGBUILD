# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: fnord0 <fnord0 AT riseup DOT net>

pkgname=dnsenum
pkgver=1.2.4.2
pkgrel=1
pkgdesc="Enumerate DNS information from a domain and discover non-contiguous ip blocks"
url='https://github.com/fwaeytens/dnsenum'
arch=('any')
license=('GPL')
depends=('perl' 'perl-net-dns' 'perl-net-ip' 'perl-net-netmask' 'perl-string-random' 'perl-xml-writer')
optdepends=(
  'perl-www-mechanize: google scraping support'
  'perl-net-whois-ip: whois query support'
)
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/fwaeytens/${pkgname}/archive/${pkgver}.tar.gz)
sha512sums=('c4ff6c6b6d6be0f60a3c784c259a51d51b6e0b72d1528efb8ed5ad038fd859d5884d13adb272b066f7b381a49b68ec6b507a9a94c2ca5061829051ff3adbc93b')

package() {
  cd ${pkgname}-${pkgver}
  install -Dm 755 ${pkgname}.pl "${pkgdir}/usr/bin/${pkgname}"
  install -Dm 644 dns.txt "${pkgdir}/usr/share/${pkgname}/dns.txt"
  install -Dm 644 README.md "${pkgdir}/usr/share/${pkgname}/doc/README.md"
}

# vim: ts=2 sw=2 et:
