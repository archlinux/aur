# This file is rendered by the release workflow. Do not publish it directly;
# the AUR repository receives the rendered PKGBUILD and .SRCINFO.
pkgname=sniplab-bin
pkgver=0.6.0
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
sha256sums_x86_64=('93571ef0b61eb53c6e81e47fee811b8a6ba13602319665ed579e34a359fbeb51')
sha256sums_aarch64=('e5dbfdd2ca45c6fbf9a0015daf834560c58472d1d28dd99e826b811c6ee84559')

package() {
  install -Dm755 snip "$pkgdir/usr/bin/snip"
  install -Dm644 man/*.1 -t "$pkgdir/usr/share/man/man1/"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
