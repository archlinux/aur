# Maintainer: ml <ml@visu.li>
pkgname=golangci-lint-bin
pkgdesc='Linters Runner for Go. 5x faster than gometalinter.'
pkgver=1.29.0
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
sha256sums_x86_64=('98b1eb7c74766079e1deebc3388c13db9bfa9fa0769046d786cf8d1553d7d68b')
sha256sums_i686=('6e11b880520e680198f15be1096ae0d9051e32e89bd9c55e0cf64d0a4482272d')
sha256sums_aarch64=('a795d8d119a475d40f1966d2f9c9b3f6a7aa6ed009777ba3bef2804d79fbfcb9')
sha256sums_armv6h=('75c746bab4f674f10aa4a9318df61f4e1d20a3bc9c386e8eb98c2b85e0c09faa')
sha256sums_armv7h=('0220446a8503c05f67b0a337e82af337ae1123ea0c631a0cb97dad619824f250')

package() {
  local x86_64=amd64 i686=386 aarch64=arm64 armv6h=armv6 armv7h=armv7
  cd "golangci-lint-${pkgver}-linux-${!CARCH}"
  install -Dm755 golangci-lint -t "$pkgdir"/usr/bin
  ./golangci-lint completion bash | install -Dm644 /dev/stdin "$pkgdir"/usr/share/bash-completion/completions/golangci-lint
  ./golangci-lint completion zsh | install -Dm644 /dev/stdin "$pkgdir"/usr/share/zsh/site-functions/_golangci-lint
}
