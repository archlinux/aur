# Maintainer: ml <ml@visu.li>
pkgname=golangci-lint-bin
pkgdesc='Linters Runner for Go. 5x faster than gometalinter.'
pkgver=1.42.1
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
sha256sums_x86_64=('214b093c15863430c4b66dd39df677dab6e38fc873ded147e331740d50eea51f')
sha256sums_i686=('19568bfe31103abbc6699830802c2eb906f05384b5c1685fbdf49942a3a62300')
sha256sums_aarch64=('0fbb58f36933b502bc841f8b28a5c609ac030d3a843fe1ea2dce2cee3a2b0d10')
sha256sums_armv6h=('81d5d829dfc93f1123867713d71e0c4e577430aa8833a2b3e7605b0ace79aff8')
sha256sums_armv7h=('28007b8d5ccc25150b800bb77a6a90cc1315467d72d4605bf5c9199cac6ecec4')

package() {
  local x86_64=amd64 i686=386 aarch64=arm64 armv6h=armv6 armv7h=armv7
  cd "golangci-lint-${pkgver}-linux-${!CARCH}"
  install -Dm755 golangci-lint -t "$pkgdir"/usr/bin
  ./golangci-lint completion bash | install -Dm644 /dev/stdin "$pkgdir"/usr/share/bash-completion/completions/golangci-lint
  ./golangci-lint completion zsh | install -Dm644 /dev/stdin "$pkgdir"/usr/share/zsh/site-functions/_golangci-lint
}
