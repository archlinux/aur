# Maintainer: ml <ml@visu.li>
pkgname=golangci-lint-bin
pkgdesc='Linters Runner for Go. 5x faster than gometalinter.'
pkgver=1.40.0
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
sha256sums_x86_64=('54d561706697cb846303046ce8ca4e03a67841d1613a320ed582d7f00d75ab56')
sha256sums_i686=('534642d5328326070872dd16ee97109b2e8e242c9f12c3b75bfe2d178f1c23b1')
sha256sums_aarch64=('20f3f174ea2e17a1a7e07d582daf607d299eafd85e56e9ee4011612fd7490634')
sha256sums_armv6h=('b8723d3503eac7a354bde27323670bef73b645edd56372bceb69575fecc2f696')
sha256sums_armv7h=('01b2a096fc252642f021e9a378592f70474306cade8cffa7c42fcae2eb9a16c1')

package() {
  local x86_64=amd64 i686=386 aarch64=arm64 armv6h=armv6 armv7h=armv7
  cd "golangci-lint-${pkgver}-linux-${!CARCH}"
  install -Dm755 golangci-lint -t "$pkgdir"/usr/bin
  ./golangci-lint completion bash | install -Dm644 /dev/stdin "$pkgdir"/usr/share/bash-completion/completions/golangci-lint
  ./golangci-lint completion zsh | install -Dm644 /dev/stdin "$pkgdir"/usr/share/zsh/site-functions/_golangci-lint
}
