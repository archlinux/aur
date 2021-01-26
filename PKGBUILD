# Maintainer: ml <ml@visu.li>
pkgname=golangci-lint-bin
pkgdesc='Linters Runner for Go. 5x faster than gometalinter.'
pkgver=1.36.0
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
sha256sums_x86_64=('9b8856b3a1c9bfbcf3a06b78e94611763b79abd9751c245246787cd3bf0e78a5')
sha256sums_i686=('09d54b2cb938465b4fb2b57970c55d51b4b01b1e2f08e6ae70d424738ed9031f')
sha256sums_aarch64=('65f2105d830552085bd8912136d809658dc0ae48ff85f4d92eda3c6faa203366')
sha256sums_armv6h=('8d3a3c76e2230ad8c8a63b43e920ef683b1d02bcf149c6e343ba67f143318622')
sha256sums_armv7h=('20ebf6112cb6935618f23010db8f802ca582ecb6c45c38a2e2fb8f5fd48d319e')

package() {
  local x86_64=amd64 i686=386 aarch64=arm64 armv6h=armv6 armv7h=armv7
  cd "golangci-lint-${pkgver}-linux-${!CARCH}"
  install -Dm755 golangci-lint -t "$pkgdir"/usr/bin
  ./golangci-lint completion bash | install -Dm644 /dev/stdin "$pkgdir"/usr/share/bash-completion/completions/golangci-lint
  ./golangci-lint completion zsh | install -Dm644 /dev/stdin "$pkgdir"/usr/share/zsh/site-functions/_golangci-lint
}
