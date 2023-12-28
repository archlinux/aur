pkgname=gandi-automatic-dns
pkgver=2.2.0
pkgrel=1
pkgdesc="Script that updates Gandi DNS reccords to point at a machine's external IP address."
arch=('any')
url='https://github.com/brianreumere/gandi-automatic-dns'
license=('custom:ISC')
depends=('openssl')
optdepends=(
  'net-tools: to discover external IP on interface using ifconfig'
  'bind-tools: to discover external IP via DNS request using dig'
)
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('4eb102e156600bf16d3c8a3a952dcf2910c5bc8c1cf2ecd1d8bedc46e7d092c4')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -D -m 0755 gad       "${pkgdir}/usr/bin/gad"
  install -D -m 0644 LICENSE   "${pkgdir}/usr/share/licenses/gandi-automatic-dns/LICENSE"
  install -D -m 0644 README.md "${pkgdir}/usr/share/doc/gandi-automatic-dns/README.md"
}
