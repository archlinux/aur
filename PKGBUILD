pkgname=ca-certificates-dn42
pkgver=20150513
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

  echo "Compare fingerprint with https://dn42.net/services/Certificate-Authority or"
  echo "  https://internal.dn42/services/Certificate-Authority"
  openssl x509 -sha256 -fingerprint -noout -in dn42.crt
}
md5sums=('acf3819613105a5285288e78b00ab67b')
sha1sums=('35fb8d352831bd591ee3175f5464efc573a017f3')
sha256sums=('7c73f59d93ff148bffbb817ac069f161736f0c2580d69418316e83fa46602992')
