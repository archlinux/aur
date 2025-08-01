# Maintainer: drzee <info@drzee.net>
pkgname=amazon-q-bin
pkgver=1.13.0
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
sha256sums_aarch64=('55d7d6c8d05a1996068e21e687c8974d79ddaebef906451beed27dc828347c3b')
sha256sums_x86_64=('2d9e053f7f2a17ba2ace61f90db0cf5a2c87fc7abf0b3674f5c66ac3cf456f64')
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
