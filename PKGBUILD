pkgname=ca-certificates-dn42
pkgver=20160116
pkgrel=1
pkgdesc="dn42 root certificates for *.dn42 and 172.22.0.0/15"
arch=(any)
url="https://dn42.net/services/Certificate-Authority"
license=('custom:RDL')
depends=(ca-certificates-utils)
install=ca-certificates-dn42.install
source=(dn42.crt)

package() {
  local certdir="$pkgdir/etc/ca-certificates/trust-source/anchors/"
  install -d "$certdir"
  install -t "$certdir" -m644 dn42.crt

  echo "Compare fingerprint with https://ca.dn42.us/crt/root-ca.crt or"
  echo "  https://ca.dn42/crt/root-ca.crt"
  openssl x509 -sha256 -fingerprint -noout -in dn42.crt
}
md5sums=('e06e30c342c09bef077b13ccadeac674')
sha1sums=('db9a03902faa7fd6d3fc9759c67d069959ae05f6')
sha256sums=('c2c31e0bdfed969a523591aba9f6452c08efdc0323d4ac080167a1d97069898b')
