# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Jörg Thalheim <joerg@higgsboson.tk>

pkgname=ca-certificates-dn42
pkgver=20160116
pkgrel=3
pkgdesc="dn42 root certificates for *.dn42 and 172.22.0.0/15"
arch=(any)
url="https://dn42.net/services/Certificate-Authority"
license=(CC0-1.0)
depends=(ca-certificates-utils)
source=(dn42.crt)
sha256sums=('c2c31e0bdfed969a523591aba9f6452c08efdc0323d4ac080167a1d97069898b')

package() {
  local certdir="$pkgdir/usr/share/ca-certificates/trust-source/anchors"
  install -Dt "$certdir" -m 644 dn42.crt

  #echo "Compare fingerprint with https://ca.dn42.us/crt/root-ca.crt or"
  #echo "  https://ca.dn42/crt/root-ca.crt"
  #openssl x509 -sha256 -fingerprint -noout -in dn42.crt
}
