# Maintainer: ml <ml@visu.li>
pkgname=golangci-lint-bin
pkgdesc='Linters Runner for Go. 5x faster than gometalinter.'
pkgver=1.26.0
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
sha256sums_x86_64=('59b0e49a4578fea574648a2fd5174ed61644c667ea1a1b54b8082fde15ef94fd')
sha256sums_i686=('b1c7a04dd7dae577af7c005a7ff9a1e6291889bf4fa5e88a9038b99080929460')
sha256sums_aarch64=('3abe739464e3d312b4debe1ec04fa3822e520c6919f4717081da0ed21c9ad184')
sha256sums_armv6h=('ee1aff109c8b9b90cd6f01fa5b76d2a264353173975c9e7d13ce85de8e7dea10')
sha256sums_armv7h=('dfdeacee84d35b43311cbcd86698091248cc7cb44e9de274573cbac1c34d7f46')

package() {
  local x86_64=amd64 i686=386 aarch64=arm64 armv6h=armv6 armv7h=armv7
  cd "golangci-lint-${pkgver}-linux-${!CARCH}"
  install -Dm755 golangci-lint -t "$pkgdir"/usr/bin
  ./golangci-lint completion bash | install -Dm644 /dev/stdin "$pkgdir"/usr/share/bash-completion/completions/golangci-lint
  ./golangci-lint completion zsh | install -Dm644 /dev/stdin "$pkgdir"/usr/share/zsh/site-functions/_golangci-lint
}
