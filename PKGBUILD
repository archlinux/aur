# Maintainer: drzee <info@drzee.net>
pkgname=amazon-q-bin
pkgver=1.12.3
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
sha256sums_aarch64=('bee4970c76c05e815c93aa4b03d827edec9f3fa7ae9c7d5e2f9ce0420f523747')
sha256sums_x86_64=('51a3a4448683f62e2a13aa2d47280e1a0c6bbfc458de68c1e26d2896802c361f')
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
