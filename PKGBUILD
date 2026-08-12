# Maintainer: Umar Alfarouk <medrivia@gmail.com>

_pkgname=tinymist
pkgname=tinymist-viewer-bin
pkgver=0.15.2
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
sha256sums_x86_64=('8f7b08c5df9d1bf399483cb6dba914cca67e40b75f3072a3c18f1bf95c651508')
sha256sums_aarch64=('1f8613f748d56d85a284ae68e9006bb9929a1b0c5ebb01a891fc20787b97920a')
sha256sums_armv7h=('9cf094717bfc23bc0784f5f19c3a5b9c6a6973c52350230d8d2cfbe5a12e3b96')

package() {
  cd "$srcdir"

  install -Dm755 tinymist-viewer-*-unknown-linux-*/tinymist-viewer "$pkgdir/usr/bin/tinymist-viewer"
  install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
