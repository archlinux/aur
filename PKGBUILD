# Maintainer: Umar Alfarouk <medrivia@gmail.com>

_pkgname=tinymist
pkgname=tinymist-viewer-bin
pkgver=0.15.10
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
sha256sums_x86_64=('dee0cd0a15ca74e1a8c45fc79dc2de738e9ff3baeac0e5fa2732bca139562ed6')
sha256sums_aarch64=('8276352f39ecab50be2ce6ccb60e00147d8b69c8e29625b6ec0f4ae60a0df758')
sha256sums_armv7h=('693bb64756329fbc588eb52afcd69dcebe093e921a833cfe1f74d8f5f3c90beb')

package() {
  cd "$srcdir"

  install -Dm755 tinymist-viewer-*-unknown-linux-*/tinymist-viewer "$pkgdir/usr/bin/tinymist-viewer"
  install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
