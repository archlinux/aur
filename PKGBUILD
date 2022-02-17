# Maintainer: ml <ml@visu.li>
pkgname=golangci-lint-bin
pkgdesc='Linters Runner for Go. 5x faster than gometalinter.'
pkgver=1.44.1
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
sha256sums_x86_64=('e7f2dc0e8a1eb5652c3570fd371d69899aa7efa19eb3db3dbc6b7948ce4a7ce9')
sha256sums_i686=('a242dc011e1c1045b60f38f27b3f3fe917a781cec85efa80b2fcad0dc08629a9')
sha256sums_aarch64=('b8680dd514449d76e224e78e5f746fca75c37e6764d3c5cb07590a15187e03d1')
sha256sums_armv6h=('4b54beb9e8b03124fde339d6de88b8684575a467af8950077f0afefcaadcbcf3')
sha256sums_armv7h=('c86747db5e5f60a8d496256f5eb6120d0326f84d9e1e1552f626a479e5550e4a')

package() {
  local x86_64=amd64 i686=386 aarch64=arm64 armv6h=armv6 armv7h=armv7
  cd "golangci-lint-${pkgver}-linux-${!CARCH}"
  install -Dm755 golangci-lint -t "$pkgdir"/usr/bin
  ./golangci-lint completion bash | install -Dm644 /dev/stdin "$pkgdir"/usr/share/bash-completion/completions/golangci-lint
  ./golangci-lint completion zsh | install -Dm644 /dev/stdin "$pkgdir"/usr/share/zsh/site-functions/_golangci-lint
}
