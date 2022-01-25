# Maintainer: ml <ml@visu.li>
pkgname=golangci-lint-bin
pkgdesc='Linters Runner for Go. 5x faster than gometalinter.'
pkgver=1.44.0
pkgrel=1
arch=('x86_64' 'i686' 'aarch64' 'armv6h' 'armv7h')
url=https://github.com/golangci/golangci-lint
license=('GPL3')
provides=('golangci-lint')
conflicts=('golangci-lint')
_src="${url}/releases/download/v${pkgver}/golangci-lint-${pkgver}-linux"
source_x86_64=("$_src"-amd64.tar.gz)
source_i686=("$_src"-386.tar.gz)
source_aarch64=("$_src"-arm64.tar.gz)
source_armv6h=("$_src"-armv6.tar.gz)
source_armv7h=("$_src"-armv7.tar.gz)
sha256sums_x86_64=('e059c301ca0bcc0af114586a7f54bab897a5a7830b81a75f614933d9e018e1a4')
sha256sums_i686=('76430aa463757f52036385bcf69308c15fb7c76adf550e694069642ab8aea3c5')
sha256sums_aarch64=('f72abcb03b0baf31dcae8c1fee5ab3a17b12d46c6281b1b959e3dd1a11f5655f')
sha256sums_armv6h=('a981a9b95a048979eb06fd329588b157c57731d7822ee44bb4f4489863dbaa0d')
sha256sums_armv7h=('0447487fd0a99f8519a49cc0a2716ffb31d982d303170b06f0174ae1ceefc520')

package() {
  local x86_64=amd64 i686=386 aarch64=arm64 armv6h=armv6 armv7h=armv7
  cd "golangci-lint-${pkgver}-linux-${!CARCH}"
  install -Dm755 golangci-lint -t "$pkgdir"/usr/bin
  ./golangci-lint completion bash | install -Dm644 /dev/stdin "$pkgdir"/usr/share/bash-completion/completions/golangci-lint
  ./golangci-lint completion zsh | install -Dm644 /dev/stdin "$pkgdir"/usr/share/zsh/site-functions/_golangci-lint
}
