# Maintainer: drzee <info@drzee.net>
pkgname=amazon-q-bin
pkgver=1.12.7
pkgrel=1
pkgdesc="Amazon Q CLI for Linux. See: https://docs.aws.amazon.com/amazonq/latest/qdeveloper-ug/command-line.html for details"
arch=('x86_64' 'aarch64')
url="https://github.com/aws/q-cli"
license=('APACHE')
groups=()
depends=('glibc>=2.34')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source_x86_64=(https://desktop-release.q.us-east-1.amazonaws.com/${pkgver}/q-x86_64-linux.zip)
source_aarch64=(https://desktop-release.q.us-east-1.amazonaws.com/${pkgver}/q-aarch64-linux.zip)
# Checksums 
sha256sums_aarch64=('29c4ffa5cbf0d0a9857a04fb25ecbbd49ef4c52196a2de569691575335144b24')
sha256sums_x86_64=('f9b8bc58a88fc27efbce1e909082e99140e0c03529108cb8a59713a6c763b25f')
noextract=()
# We set options here to superseed the default makepkg.conf options. We dont whant debug build or strip debug info from the package. Its not relevant for a binary repackage of the upstream package.
options=(!debug !strip)
install=${pkgname}.install

package() {
  install -d "$pkgdir/usr/bin/"
  install -Dm755 "$srcdir/q/bin/q" "$pkgdir/usr/bin/"
  install -Dm755 "$srcdir/q/bin/qterm" "$pkgdir/usr/bin/"
  install -Dm755 "$srcdir/q/bin/qchat" "$pkgdir/usr/bin/"
}
