# Maintainer: Jake Leahy <jake@lowerCaseLastName.dev>

pkgname=typst-lsp-bin
pkgver=0.10.1
pkgrel=1
pkgdesc="A brand-new language server for Typst"
arch=("x86_64" "armv7h" "aarch64")
url="https://github.com/nvarner/typst-lsp"
license=("MIT")

source_x86_64=("typst-lsp-x86_64-$pkgver::https://github.com/nvarner/typst-lsp/releases/download/v$pkgver/typst-lsp-x86_64-unknown-linux-gnu")
source_armv7h=("typst-lsp-armv7h-$pkgver::https://github.com/nvarner/typst-lsp/releases/download/v$pkgver/typst-lsp-arm-unknown-linux-gnueabihf")
source_aarch64=("typst-lsp-aarch64-$pkgver::https://github.com/nvarner/typst-lsp/releases/download/v$pkgver/typst-lsp-aarch64-unknown-linux-gnu")

sha256sums_x86_64=('6d78712e75aaa360295f8b9303072f014862f81255d2325ab961a462c8228fb0')
sha256sums_armv7h=('9bd06b8f24dfd55d8a58854da3fd44656d5846a6052475c7dab7a5d1d002795c')
sha256sums_aarch64=('b255e05bbfbd374bc391241bdf5c5574edeb117b1c42a1855737b5a9a6484634')

provides=("typst-lsp")
depends=("glibc" "gcc-libs")

package() {
  cd "$srcdir/"
  install -Dm 755 typst-lsp-$CARCH-$pkgver "${pkgdir}/usr/bin/typst-lsp"
}
