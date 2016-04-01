pkgname=ca-certificates-hackint
pkgver=20150513
pkgrel=2
pkgdesc="hackint root certificates for irc.hackint.org"
arch=(any)
url="https://www.hackint.org/ca.html"
license=('custom:RDL')
depends=(ca-certificates-utils)
install=install
source=('hackint.crt')
sha256sums=('39dd38b790624c12224a08489f1c09522fd93fef17c17b1abd4efc235fe0df83')

package() {
  install -Dm644 hackint.crt "$pkgdir/usr/share/ca-certificates/trust-source/anchors/hackint.crt"

  echo "Compare fingerprint with https://www.hackint.org/ca.html"
  openssl x509 -sha256 -fingerprint -noout -in hackint.crt
}
