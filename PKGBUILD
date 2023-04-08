# Maintainer: Jake Leahy <jake@lowerCaseLastName.dev

pkgname=typst-lsp-bin
pkgver=0.3.2
pkgrel=3
pkgdesc="A brand-new language server for Typst,"
arch=("x86_64" "armv7h" "aarch64")
url="https://github.com/nvarner/typst-lsp"
license=("MIT")

source_x86_64=("typst-lsp_x86_64-$pkgver::https://github.com/nvarner/typst-lsp/releases/download/v$pkgver/typst-lsp-linux-x64")
source_armv7h=("typst-lsp_armv7-$pkgver::https://github.com/nvarner/typst-lsp/releases/download/v$pkgver/typst-lsp-linux-armhf")
source_aarch64=("typst-lsp_aarch64-$pkgver::https://github.com/nvarner/typst-lsp/releases/download/v$pkgver/typst-lsp-linux-arm64")

sha256sums_x86_64=('0b3f629ea1350fb03c864661949d338b5d720b5aefbc72f0241fa3c60b020dad')
sha256sums_armv7h=('c72ec0e4298ccb0109f26f48af810996d069a5dedfdab56591c38821b8beded8')
sha256sums_aarch64=('ee6036ea7af1538a3b2cfc9eb50ba81cd6c31e8745d455a5828ed575cbb8b66c')

provides=("typst-lsp")
depends=("glibc" "gcc-libs")

package() {
  cd "$srcdir/"
  install -Dm 755 typst-lsp-$pkgver "${pkgdir}/usr/bin/typst-lsp"
}
