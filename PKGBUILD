# Maintainer: ml <ml@visu.li>
pkgname=golangci-lint-bin
pkgdesc='Linters Runner for Go. 5x faster than gometalinter.'
pkgver=1.35.0
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
sha256sums_x86_64=('d0c0793fe4a6e752c724eb13e01b27aa4ab37e32c5e99a4d8a4b8594cb5d77bd')
sha256sums_i686=('bd79bd675c333e1e37c2ef82fcfdd32dfe611ccf6af1ac89bad018f92afd7e3e')
sha256sums_aarch64=('9dedf7fcdbb3e7068131fd8103ed4c53052d0702085f5f379307650d511f8170')
sha256sums_armv6h=('562c7eb303484c66a926b661be2d35443cd10df02561ca5271260f2f6efb1e26')
sha256sums_armv7h=('8cf157cba9c5f50919f0d7eeb9f2d1df0037e90b05170fe7b68e893e2523a602')

package() {
  local x86_64=amd64 i686=386 aarch64=arm64 armv6h=armv6 armv7h=armv7
  cd "golangci-lint-${pkgver}-linux-${!CARCH}"
  install -Dm755 golangci-lint -t "$pkgdir"/usr/bin
  ./golangci-lint completion bash | install -Dm644 /dev/stdin "$pkgdir"/usr/share/bash-completion/completions/golangci-lint
  ./golangci-lint completion zsh | install -Dm644 /dev/stdin "$pkgdir"/usr/share/zsh/site-functions/_golangci-lint
}
