pkgname=ca-certificates-hackint
pkgver=20150513
pkgrel=2
pkgdesc="hackint root certificates for irc.hackint.org"
arch=(any)
url="https://www.hackint.org/ca.html"
license=('custom:RDL')
depends=(ca-certificates-utils)
install=install
source=(hackint.crt)

package() {
  local certdir="$pkgdir/usr/share/ca-certificates/trust-source/anchors/"
  install -d "$certdir"
  install -t "$certdir" -m644 hackint.crt

  echo "Compare fingerprint with https://www.hackint.org/ca.html"
  openssl x509 -sha256 -fingerprint -noout -in hackint.crt
}
md5sums=('0bbdc4b70b26efeff1adb9568a864f8a')
sha1sums=('f322ec9100abc7ea163864592c21a216514aae0e')
sha256sums=('39dd38b790624c12224a08489f1c09522fd93fef17c17b1abd4efc235fe0df83')
