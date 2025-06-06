# Maintainer: drzee <info@drzee.net>
pkgname=amazon-q-bin
pkgver=1.11.0
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
sha256sums_aarch64=('dc6320e2b95ff983f2e5b4b6b0ff1840ea45d96658309264ea83a17df3bf01a7')
sha256sums_x86_64=('31f41e831e42bc47a2ee72fb9acb94e5e5701075a1d8b49a706f446a8d7fc967')
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
