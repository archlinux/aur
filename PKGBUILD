# Maintainer: Jake Leahy <jake@lowerCaseLastName.dev>

pkgname=typst-lsp-bin
pkgver=0.4.1
pkgrel=1
pkgdesc="A brand-new language server for Typst"
arch=("x86_64" "armv7h" "aarch64")
url="https://github.com/nvarner/typst-lsp"
license=("MIT")

source_x86_64=("typst-lsp-x86_64-$pkgver::https://github.com/nvarner/typst-lsp/releases/download/v$pkgver/typst-lsp-linux-x64")
source_armv7h=("typst-lsp-armv7h-$pkgver::https://github.com/nvarner/typst-lsp/releases/download/v$pkgver/typst-lsp-linux-armhf")
source_aarch64=("typst-lsp-aarch64-$pkgver::https://github.com/nvarner/typst-lsp/releases/download/v$pkgver/typst-lsp-linux-arm64")

sha256sums_x86_64=('0ece398e982f2e7528687399234c792740811104d7ad0d5d79a2f64a7ea4e531')
sha256sums_armv7h=('a79e4a3f880251c0c724f9bc397bcbc98e5d2ad366ce00e4bdde562a4c1d7c59')
sha256sums_aarch64=('5877525ade1635306dbc4ef3382afd9289069d393f4fdf0afacf9a51d5104105')

provides=("typst-lsp")
depends=("glibc" "gcc-libs")

package() {
  cd "$srcdir/"
  install -Dm 755 typst-lsp-$CARCH-$pkgver "${pkgdir}/usr/bin/typst-lsp"
}
