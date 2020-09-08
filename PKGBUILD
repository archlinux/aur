# Maintainer: ml <ml@visu.li>
pkgname=golangci-lint-bin
pkgdesc='Linters Runner for Go. 5x faster than gometalinter.'
pkgver=1.31.0
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
sha256sums_x86_64=('9a5d47b51442d68b718af4c7350f4406cdc087e2236a5b9ae52f37aebede6cb3')
sha256sums_i686=('a68a7d845034352a3ccb0886efdc488e6383144a9c245d041dde799580b671e3')
sha256sums_aarch64=('9fff85f4649d17d18ebbcb775fec05de42a83e08787af1850f8f5f8dd4c066e9')
sha256sums_armv6h=('d9ce8edd34994abead106f6a58337ca9396c8d0b1352bb19f7cd731ea9ea2021')
sha256sums_armv7h=('e60257d148bd655438622853b28b9ca65d20919d62115ce87ccb45d136592643')

package() {
  local x86_64=amd64 i686=386 aarch64=arm64 armv6h=armv6 armv7h=armv7
  cd "golangci-lint-${pkgver}-linux-${!CARCH}"
  install -Dm755 golangci-lint -t "$pkgdir"/usr/bin
  ./golangci-lint completion bash | install -Dm644 /dev/stdin "$pkgdir"/usr/share/bash-completion/completions/golangci-lint
  ./golangci-lint completion zsh | install -Dm644 /dev/stdin "$pkgdir"/usr/share/zsh/site-functions/_golangci-lint
}
