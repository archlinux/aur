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
sha256sums_x86_64=('b83eaff492a64efffaadc678db94b0eb8c7b42f87d7cd247485e7edcec84cc85')
sha256sums_aarch64=('1d6bfbf1083a54cd248fdaa90f00f707684682581216e349afa1b5f31857845d')

package() {
  install -Dm755 snip "$pkgdir/usr/bin/snip"
  install -Dm644 man/*.1 -t "$pkgdir/usr/share/man/man1/"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
