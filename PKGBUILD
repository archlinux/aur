pkgname=ca-certificates-spi
pkgver=20150513
pkgrel=1
pkgdesc="SPI CA root certificate"
arch=(any)
url="http://www.spi-inc.org/ca/"
license=('custom:RDL')
depends=(ca-certificates-utils)
install=install
source=(spi-cacert.crt)

package() {
  local certdir="$pkgdir/etc/ca-certificates/trust-source/anchors/"
  install -d "$certdir"
  install -t "$certdir" -m644 spi-cacert.crt

  echo "Compare fingerprint with http://www.spi-inc.org/ca/"
  openssl x509 -fingerprint -noout -in spi-cacert.crt
  openssl x509 -md5 -fingerprint -noout -in spi-cacert.crt
  openssl x509 -sha256 -fingerprint -noout -in spi-cacert.crt
}
md5sums=('fa268b79e0ef3ef5085a9a2303303e59')
sha1sums=('09862292e3b649d3eb94c4dafd62420918f29836')
sha256sums=('167d78086e9e96632b774a182dd14588e9dd32e2c7ba2aa5f9500791a0dd64ab')
