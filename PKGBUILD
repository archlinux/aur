# This file is rendered by the release workflow. Do not publish it directly;
# the AUR repository receives the rendered PKGBUILD and .SRCINFO.
pkgname=sniplab-bin
pkgver=0.6.3
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
sha256sums_x86_64=('dc4858bfab3bec5834c98783d7f75d3987bb48232f377966c0d8b391eb63a1f1')
sha256sums_aarch64=('c3837bfa8dd91c014d53ab6b34d60e4866229ae21ef7a616bbafa3744fbbd6da')

package() {
  install -Dm755 snip "$pkgdir/usr/bin/snip"
  install -Dm644 man/*.1 -t "$pkgdir/usr/share/man/man1/"
  install -Dm644 man/*.5 -t "$pkgdir/usr/share/man/man5/"
  install -Dm644 man/*.7 -t "$pkgdir/usr/share/man/man7/"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
