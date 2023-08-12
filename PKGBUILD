# Maintainer: Jake Leahy <jake@lowerCaseLastName.dev>

pkgname=typst-lsp-bin
pkgver=0.7.2
pkgrel=1
pkgdesc="A brand-new language server for Typst"
arch=("x86_64" "armv7h" "aarch64")
url="https://github.com/nvarner/typst-lsp"
license=("MIT")

source_x86_64=("typst-lsp-x86_64-$pkgver::https://github.com/nvarner/typst-lsp/releases/download/v$pkgver/typst-lsp-x86_64-unknown-linux-gnu")
source_armv7h=("typst-lsp-armv7h-$pkgver::https://github.com/nvarner/typst-lsp/releases/download/v$pkgver/typst-lsp-arm-unknown-linux-gnueabihf")
source_aarch64=("typst-lsp-aarch64-$pkgver::https://github.com/nvarner/typst-lsp/releases/download/v$pkgver/typst-lsp-aarch64-unknown-linux-gnu")

sha256sums_x86_64=('5780b84e1d7c1d1e1175bfd5b01f4c192e3b0d4ec757fcac74a0cbe1e91eaa41')
sha256sums_armv7h=('5aafeb0117a0f32a364630f5803ceb27da7913726926a1c38b8bf46e29c8ef84')
sha256sums_aarch64=('7558c8aaed113afc429dafdeb3fa552cb43f9d794c72f03a92030bdc2d5e27c1')

provides=("typst-lsp")
depends=("glibc" "gcc-libs")

package() {
  cd "$srcdir/"
  install -Dm 755 typst-lsp-$CARCH-$pkgver "${pkgdir}/usr/bin/typst-lsp"
}
