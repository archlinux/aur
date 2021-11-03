# Maintainer: ml <ml@visu.li>
pkgname=golangci-lint-bin
pkgdesc='Linters Runner for Go. 5x faster than gometalinter.'
pkgver=1.43.0
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
sha256sums_x86_64=('f3515cebec926257da703ba0a2b169e4a322c11dc31a8b4656b50a43e48877f4')
sha256sums_i686=('2c98fc0d6bc2376693b5c372421b7e68c3986c12ae0f277127b441003d24a8a2')
sha256sums_aarch64=('e21c681735faf4efd4086f95d5b49904b0bbbe510dd2058058047a8dbfaee546')
sha256sums_armv6h=('fb7f6d4d39028570d70f81f42f4eaec2db62efe40d86c01fb9d9666b304372aa')
sha256sums_armv7h=('05e56dfeb15db6d1de6beba1c9cba4a8ce81479195e03b87e86f163eab380031')

package() {
  local x86_64=amd64 i686=386 aarch64=arm64 armv6h=armv6 armv7h=armv7
  cd "golangci-lint-${pkgver}-linux-${!CARCH}"
  install -Dm755 golangci-lint -t "$pkgdir"/usr/bin
  ./golangci-lint completion bash | install -Dm644 /dev/stdin "$pkgdir"/usr/share/bash-completion/completions/golangci-lint
  ./golangci-lint completion zsh | install -Dm644 /dev/stdin "$pkgdir"/usr/share/zsh/site-functions/_golangci-lint
}
