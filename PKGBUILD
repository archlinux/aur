# Maintainer: Umar Alfarouk <medrivia@gmail.com>

_pkgname=tinymist
pkgname=tinymist-viewer-bin
pkgver=0.15.8
pkgrel=1
pkgdesc="Standalone native preview client for Tinymist (Typst language server)"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/Myriad-Dreamin/tinymist"
license=('Apache-2.0')
depends=('libgcc')
provides=("tinymist-viewer=$pkgver")
conflicts=('tinymist-viewer')
options=('!debug')
source=("LICENSE-$pkgver::https://raw.githubusercontent.com/Myriad-Dreamin/$_pkgname/v$pkgver/LICENSE")
source_x86_64=("tinymist-viewer-$pkgver-x86_64.tar.gz::https://github.com/Myriad-Dreamin/$_pkgname/releases/download/v$pkgver/tinymist-viewer-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("tinymist-viewer-$pkgver-aarch64.tar.gz::https://github.com/Myriad-Dreamin/$_pkgname/releases/download/v$pkgver/tinymist-viewer-aarch64-unknown-linux-gnu.tar.gz")
source_armv7h=("tinymist-viewer-$pkgver-armv7.tar.gz::https://github.com/Myriad-Dreamin/$_pkgname/releases/download/v$pkgver/tinymist-viewer-armv7-unknown-linux-gnueabihf.tar.gz")
sha256sums=('a9f29769fd3a7ee2976e6e161a93e16461fa305c088c4806242e50ec8ef86bce')
sha256sums_x86_64=('a19561a5b498217763756c64c6d711cba64650e3a34dc57f1cc4a5cef52ed676')
sha256sums_aarch64=('f799af97e1487e5f5797cfbca5a4e852e58843e12998da7698682bfadf14a3bb')
sha256sums_armv7h=('28c806c61ae195d60cbd9f8028ba06c0e17013e10f4e1c284aa882b1b622646b')

package() {
  cd "$srcdir"

  install -Dm755 tinymist-viewer-*-unknown-linux-*/tinymist-viewer "$pkgdir/usr/bin/tinymist-viewer"
  install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
