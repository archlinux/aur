# Maintainer: ml <ml@visu.li>
pkgname=golangci-lint-bin
pkgdesc='Linters Runner for Go. 5x faster than gometalinter.'
pkgver=1.28.1
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
sha256sums_x86_64=('ed36507947c0fa61bda3f022d7e240f76b58554bf986e03042f68279450dc7e1')
sha256sums_i686=('74d5b4a853beb55ff0e38acd960329bbdc8df8304b498ad914f5a402c2d00531')
sha256sums_aarch64=('b122011afabde7b508f19bfd559be5a3d11c3b4a2d04d0a79f8a5f0111e70a6b')
sha256sums_armv6h=('69e1a227afeacdb20ab045790ee232bb5f74ed99c074bac114adcb09cb3be7c1')
sha256sums_armv7h=('edbf9f03f804392f76c76cacd89ad2b7429ca8ff46441362f89939163c305684')

package() {
  local x86_64=amd64 i686=386 aarch64=arm64 armv6h=armv6 armv7h=armv7
  cd "golangci-lint-${pkgver}-linux-${!CARCH}"
  install -Dm755 golangci-lint -t "$pkgdir"/usr/bin
  ./golangci-lint completion bash | install -Dm644 /dev/stdin "$pkgdir"/usr/share/bash-completion/completions/golangci-lint
  ./golangci-lint completion zsh | install -Dm644 /dev/stdin "$pkgdir"/usr/share/zsh/site-functions/_golangci-lint
}
