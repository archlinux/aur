# Maintainer: Jake Leahy <jake@lowerCaseLastName.dev>

pkgname=typst-lsp-bin
pkgver=0.11.0
pkgrel=1
pkgdesc="A brand-new language server for Typst"
arch=("x86_64" "armv7h" "aarch64")
url="https://github.com/nvarner/typst-lsp"
license=("MIT")

source_x86_64=("typst-lsp-x86_64-$pkgver::https://github.com/nvarner/typst-lsp/releases/download/v$pkgver/typst-lsp-x86_64-unknown-linux-gnu")
source_armv7h=("typst-lsp-armv7h-$pkgver::https://github.com/nvarner/typst-lsp/releases/download/v$pkgver/typst-lsp-arm-unknown-linux-gnueabihf")
source_aarch64=("typst-lsp-aarch64-$pkgver::https://github.com/nvarner/typst-lsp/releases/download/v$pkgver/typst-lsp-aarch64-unknown-linux-gnu")

sha256sums_x86_64=('c0ac22ce00c88688f5dc772103eaada2ff5e33612f3b94f654e953f78504d6a2')
sha256sums_armv7h=('62d83164a62789a58bd400b8c502fc9055b50273061acd5acc25b5b4f2bbdd4b')
sha256sums_aarch64=('ad53b95c4afe2beed1d44d8dd28ccfd86f8113d8efb8ce2df91df5ba21e7cb62')

provides=("typst-lsp")
depends=("glibc" "gcc-libs")

package() {
  cd "$srcdir/"
  install -Dm 755 typst-lsp-$CARCH-$pkgver "${pkgdir}/usr/bin/typst-lsp"
}
