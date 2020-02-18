pkgname=gandi-automatic-dns
pkgver=1.4.0
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
sha256sums=('36e690aff0f2737db70e96df4d7e644cae225d8581fcbd59da5f1dbe49aa3808')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -D -m 0755 gad       "${pkgdir}/usr/bin/gad"
  install -D -m 0644 LICENSE   "${pkgdir}/usr/share/licenses/gandi-automatic-dns/LICENSE"
  install -D -m 0644 README.md "${pkgdir}/usr/share/doc/gandi-automatic-dns/README.md"
}
