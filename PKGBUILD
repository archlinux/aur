# Maintainer: ml <ml@visu.li>
pkgname=golangci-lint-bin
pkgdesc='Linters Runner for Go. 5x faster than gometalinter.'
pkgver=1.44.2
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
sha256sums_x86_64=('461e238f83e2b3deb48665be15d835fd3eab75a9a0138074ca2ad81315e0c3aa')
sha256sums_i686=('f6736a472366c09c163f0e0da051047cf6827939c40a3cb3cf4bedc53c8d0bd1')
sha256sums_aarch64=('0dd3510a62975d69f0907448d9a1e489325612522abaafd79bd18515b931a11f')
sha256sums_armv6h=('6fc6bd3438de33c6a9a654d8e5bea7e12868fb80b29001ba7cf96d937b1e9a8e')
sha256sums_armv7h=('d20e2f937eddd6412f0d8d9754a9c6a71807d779a99ebfd5d5ccee28d1faabe3')

package() {
  local x86_64=amd64 i686=386 aarch64=arm64 armv6h=armv6 armv7h=armv7
  cd "golangci-lint-${pkgver}-linux-${!CARCH}"
  install -Dm755 golangci-lint -t "$pkgdir"/usr/bin
  ./golangci-lint completion bash | install -Dm644 /dev/stdin "$pkgdir"/usr/share/bash-completion/completions/golangci-lint
  ./golangci-lint completion zsh | install -Dm644 /dev/stdin "$pkgdir"/usr/share/zsh/site-functions/_golangci-lint
}
