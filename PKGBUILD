# Maintainer: Jake Leahy <jake@lowerCaseLastName.dev>

pkgname=typst-lsp-bin
pkgver=0.7.1
pkgrel=1
pkgdesc="A brand-new language server for Typst"
arch=("x86_64" "armv7h" "aarch64")
url="https://github.com/nvarner/typst-lsp"
license=("MIT")

source_x86_64=("typst-lsp-x86_64-$pkgver::https://github.com/nvarner/typst-lsp/releases/download/v$pkgver/typst-lsp-linux-x64")
source_armv7h=("typst-lsp-armv7h-$pkgver::https://github.com/nvarner/typst-lsp/releases/download/v$pkgver/typst-lsp-linux-armhf")
source_aarch64=("typst-lsp-aarch64-$pkgver::https://github.com/nvarner/typst-lsp/releases/download/v$pkgver/typst-lsp-linux-arm64")

sha256sums_x86_64=('a958c51069769380e38d69b555ff38075db9157d33d94ead219a55efc7880a63')
sha256sums_armv7h=('da7e35f45387d3f998d5a583873912973773853002751873c96e89d87846090f')
sha256sums_aarch64=('a9c8fe2bdd496001be964812d6f52ae59e9c337511e278ea0596c74a709a3925')

provides=("typst-lsp")
depends=("glibc" "gcc-libs")

package() {
  cd "$srcdir/"
  install -Dm 755 typst-lsp-$CARCH-$pkgver "${pkgdir}/usr/bin/typst-lsp"
}
