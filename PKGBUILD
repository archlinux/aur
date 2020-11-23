# Maintainer: ml <ml@visu.li>
pkgname=golangci-lint-bin
pkgdesc='Linters Runner for Go. 5x faster than gometalinter.'
pkgver=1.33.0
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
sha256sums_x86_64=('e2d6082f1df53c5d2c280765000f9e82783ea909ba419c6c4e172936b076031e')
sha256sums_i686=('2cc99be6ce141b62629704164067b35fb9203b6234d3db396fcdd17c4afb42a5')
sha256sums_aarch64=('3a3358960abd50e509df043e8dcd0367441cbecea8516eec7ef2cf6a7eddd8d5')
sha256sums_armv6h=('a0244622da733c0441df22378c58dc42a9ea9cb1a93f5511deffba33b4966b79')
sha256sums_armv7h=('d10ee9d3ca8700ecd078e6a0b022fdae97c6c39ee15ec0382b381a5e6db74152')

package() {
  local x86_64=amd64 i686=386 aarch64=arm64 armv6h=armv6 armv7h=armv7
  cd "golangci-lint-${pkgver}-linux-${!CARCH}"
  install -Dm755 golangci-lint -t "$pkgdir"/usr/bin
  ./golangci-lint completion bash | install -Dm644 /dev/stdin "$pkgdir"/usr/share/bash-completion/completions/golangci-lint
  ./golangci-lint completion zsh | install -Dm644 /dev/stdin "$pkgdir"/usr/share/zsh/site-functions/_golangci-lint
}
