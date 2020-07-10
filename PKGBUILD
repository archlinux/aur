# Maintainer: ml <ml@visu.li>
pkgname=golangci-lint-bin
pkgdesc='Linters Runner for Go. 5x faster than gometalinter.'
pkgver=1.28.2
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
sha256sums_x86_64=('c893b07dd7d2c8e13b6380dd52781bb6732f7f541d90da2dc941be5f7e8be6fb')
sha256sums_i686=('2b33179ec5210b12ad350bf2c7653e2ec82a7c265ae3b172a60e64764a64bacc')
sha256sums_aarch64=('caf75926959dafeca1094ad0f625e0344381af8057a2aafba12297553bd2b0d8')
sha256sums_armv6h=('71ac2a1e912ed7ec151f19ffacd6c8d82d20d8d3801b9384a59b5d02174160ed')
sha256sums_armv7h=('ce616b7cb8cf07f340d3832f4bcaf4af17b110f5e3600dbe76ba29b2b8dc18e8')

package() {
  local x86_64=amd64 i686=386 aarch64=arm64 armv6h=armv6 armv7h=armv7
  cd "golangci-lint-${pkgver}-linux-${!CARCH}"
  install -Dm755 golangci-lint -t "$pkgdir"/usr/bin
  ./golangci-lint completion bash | install -Dm644 /dev/stdin "$pkgdir"/usr/share/bash-completion/completions/golangci-lint
  ./golangci-lint completion zsh | install -Dm644 /dev/stdin "$pkgdir"/usr/share/zsh/site-functions/_golangci-lint
}
