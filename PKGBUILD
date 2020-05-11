pkgname=gandi-automatic-dns
pkgver=1.4.1
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
sha256sums=('bce31b9e700f3ce687c57f0d6ee3885371a63d0888ac33c0b26419ed43cccb46')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -D -m 0755 gad       "${pkgdir}/usr/bin/gad"
  install -D -m 0644 LICENSE   "${pkgdir}/usr/share/licenses/gandi-automatic-dns/LICENSE"
  install -D -m 0644 README.md "${pkgdir}/usr/share/doc/gandi-automatic-dns/README.md"
}
