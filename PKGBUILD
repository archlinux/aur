pkgname=gandi-automatic-dns
pkgver=1.3.3
pkgrel=1
pkgdesc="Script that updates Gandi DNS reccords to point at a machine's external IP address."
arch=('any')
url='https://github.com/brianpcurran/gandi-automatic-dns'
license=('custom:ISC')
depends=('openssl')
optdepends=(
  'net-tools: to discover external IP on interface using ifconfig'
  'bind-tools: to discover external IP via DNS request using dig'
)
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('3dbd31ceb6b5b40e65cb1673ccc61af442e365013749f33e3e38ae6782bdbfa3')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -D -m 0755 gad       "${pkgdir}/usr/bin/gad"
  install -D -m 0644 LICENSE   "${pkgdir}/usr/share/licenses/gandi-automatic-dns/LICENSE"
  install -D -m 0644 README.md "${pkgdir}/usr/share/doc/gandi-automatic-dns/README.md"
}
