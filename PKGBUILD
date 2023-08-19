# Maintainer: Jake Leahy <jake@lowerCaseLastName.dev>

pkgname=typst-lsp-bin
pkgver=0.9.4
pkgrel=1
pkgdesc="A brand-new language server for Typst"
arch=("x86_64" "armv7h" "aarch64")
url="https://github.com/nvarner/typst-lsp"
license=("MIT")

source_x86_64=("typst-lsp-x86_64-$pkgver::https://github.com/nvarner/typst-lsp/releases/download/v$pkgver/typst-lsp-x86_64-unknown-linux-gnu")
source_armv7h=("typst-lsp-armv7h-$pkgver::https://github.com/nvarner/typst-lsp/releases/download/v$pkgver/typst-lsp-arm-unknown-linux-gnueabihf")
source_aarch64=("typst-lsp-aarch64-$pkgver::https://github.com/nvarner/typst-lsp/releases/download/v$pkgver/typst-lsp-aarch64-unknown-linux-gnu")

sha256sums_x86_64=('40cafae2bcf49bd043f26a87f56fcace82f4194aad185891a301fc4ba0ffb68b')
sha256sums_armv7h=('b6f7790730095679f7c32df56a57e02fbe44884847b4860cc70e5cf5f99019c5')
sha256sums_aarch64=('5d238e0d4f75e348a7fca3ba593047e1d3e531218c56f0131d108ea72066fecd')

provides=("typst-lsp")
depends=("glibc" "gcc-libs")

package() {
  cd "$srcdir/"
  install -Dm 755 typst-lsp-$CARCH-$pkgver "${pkgdir}/usr/bin/typst-lsp"
}
