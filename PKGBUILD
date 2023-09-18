# Maintainer: Jake Leahy <jake@lowerCaseLastName.dev>

pkgname=typst-lsp-bin
pkgver=0.10.0
pkgrel=1
pkgdesc="A brand-new language server for Typst"
arch=("x86_64" "armv7h" "aarch64")
url="https://github.com/nvarner/typst-lsp"
license=("MIT")

source_x86_64=("typst-lsp-x86_64-$pkgver::https://github.com/nvarner/typst-lsp/releases/download/v$pkgver/typst-lsp-x86_64-unknown-linux-gnu")
source_armv7h=("typst-lsp-armv7h-$pkgver::https://github.com/nvarner/typst-lsp/releases/download/v$pkgver/typst-lsp-arm-unknown-linux-gnueabihf")
source_aarch64=("typst-lsp-aarch64-$pkgver::https://github.com/nvarner/typst-lsp/releases/download/v$pkgver/typst-lsp-aarch64-unknown-linux-gnu")

sha256sums_x86_64=('99db2afe96b4f60de818e075e08013932da0228bc2c80128269ae4b0d4c7bb55')
sha256sums_armv7h=('c4b6835799823da387425ffaa10b50e09ec3cdd6fb33b735728021128c5c5457')
sha256sums_aarch64=('ab2bf94349879d31cc7b71dc7782313efaff51c17438abd79c67fb1d6557c803')

provides=("typst-lsp")
depends=("glibc" "gcc-libs")

package() {
  cd "$srcdir/"
  install -Dm 755 typst-lsp-$CARCH-$pkgver "${pkgdir}/usr/bin/typst-lsp"
}
