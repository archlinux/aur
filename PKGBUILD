# Maintainer: ml <ml@visu.li>
pkgname=golangci-lint-bin
pkgdesc='Linters Runner for Go. 5x faster than gometalinter.'
pkgver=1.35.2
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
sha256sums_x86_64=('8f9ede0ec40beca515b619e6aede57e59b86407e110882fbe3f947f1fa10032d')
sha256sums_i686=('4947e75c5506acd50d303966670643081956fa81c4186203c9d64067e6c90316')
sha256sums_aarch64=('f4bd73ee9b2aa9ec95e20e5b5775c99f24732390215720795f2d7458baebd35e')
sha256sums_armv6h=('c984887c6cb123a93bb00352336ad35d886bc175bb5a68b1dc3baf6881aa5c5a')
sha256sums_armv7h=('439cdcc390e285d398ec4bc8cc40776df1ac36978bcac8dd693406822efdae2a')

package() {
  local x86_64=amd64 i686=386 aarch64=arm64 armv6h=armv6 armv7h=armv7
  cd "golangci-lint-${pkgver}-linux-${!CARCH}"
  install -Dm755 golangci-lint -t "$pkgdir"/usr/bin
  ./golangci-lint completion bash | install -Dm644 /dev/stdin "$pkgdir"/usr/share/bash-completion/completions/golangci-lint
  ./golangci-lint completion zsh | install -Dm644 /dev/stdin "$pkgdir"/usr/share/zsh/site-functions/_golangci-lint
}
