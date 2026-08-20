# This file is rendered by the release workflow. Do not publish it directly;
# the AUR repository receives the rendered PKGBUILD and .SRCINFO.
pkgname=sniplab-bin
pkgver=0.6.1
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
sha256sums_x86_64=('f0c17664884746ff2595f46425d53b94bea1b8fc1af08897a6de59f5c033ae56')
sha256sums_aarch64=('815b74a3bda523ab55449afc348eefff38302b93b7933525fd4c97a9d27d7263')

package() {
  install -Dm755 snip "$pkgdir/usr/bin/snip"
  install -Dm644 man/*.1 -t "$pkgdir/usr/share/man/man1/"
  install -Dm644 man/*.5 -t "$pkgdir/usr/share/man/man5/"
  install -Dm644 man/*.7 -t "$pkgdir/usr/share/man/man7/"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
