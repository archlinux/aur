# Maintainer: ml <ml@visu.li>
pkgname=golangci-lint-bin
pkgdesc='Linters Runner for Go. 5x faster than gometalinter.'
pkgver=1.28.0
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
sha256sums_x86_64=('179d34edf4baf6454a7081fbaaf74dc99397a3be8e1a535dee04d835a977bf76')
sha256sums_i686=('05e511883e573ef44281716fd3f5e2ecf1ae4843b465465231577ff70bf6df96')
sha256sums_aarch64=('101ac21fb47ddb064f740a03265c38b9049882165baa0bd6bfa7bd6df6203448')
sha256sums_armv6h=('8ff305a2cb7c419f6d1515c24fbcb1e41762e6c640eb5e8350c8530c9f0fcb77')
sha256sums_armv7h=('c79c945d123d3fbfad40a4049146cf192bee2e7c87094a7ca76541658a04bdec')

package() {
  local x86_64=amd64 i686=386 aarch64=arm64 armv6h=armv6 armv7h=armv7
  cd "golangci-lint-${pkgver}-linux-${!CARCH}"
  install -Dm755 golangci-lint -t "$pkgdir"/usr/bin
  ./golangci-lint completion bash | install -Dm644 /dev/stdin "$pkgdir"/usr/share/bash-completion/completions/golangci-lint
  ./golangci-lint completion zsh | install -Dm644 /dev/stdin "$pkgdir"/usr/share/zsh/site-functions/_golangci-lint
}
