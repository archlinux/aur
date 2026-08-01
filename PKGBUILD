# This file is rendered by the release workflow. Do not publish it directly;
# the AUR repository receives the rendered PKGBUILD and .SRCINFO.
pkgname=sniplab-bin
pkgver=0.4.1
pkgrel=1
pkgdesc='Filesystem-native snippet library and terminal CLI (prebuilt)'
arch=('x86_64' 'aarch64')
url='https://github.com/gitkeniwo/snip'
license=('MIT')
provides=('sniplab' 'snip')
conflicts=('sniplab')
depends=('gcc-libs')
source_x86_64=(
  "snip-x86_64-unknown-linux-gnu.tar.gz::https://github.com/gitkeniwo/snip/releases/download/v$pkgver/snip-x86_64-unknown-linux-gnu.tar.gz"
)
source_aarch64=(
  "snip-aarch64-unknown-linux-gnu.tar.gz::https://github.com/gitkeniwo/snip/releases/download/v$pkgver/snip-aarch64-unknown-linux-gnu.tar.gz"
)
sha256sums_x86_64=('94b56807d2f5cf487db9ea3329ee398104721c466bd98e0e9fc6fef82da359e9')
sha256sums_aarch64=('c79448be8f07684c4c3122f25cc29778b67cedbcab1f87f0c2bf14aaf466d20e')

package() {
  install -Dm755 snip "$pkgdir/usr/bin/snip"
  install -Dm644 man/*.1 -t "$pkgdir/usr/share/man/man1/"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
