# Maintainer: ml <ml@visu.li>
pkgname=golangci-lint-bin
pkgdesc='Linters Runner for Go. 5x faster than gometalinter.'
pkgver=1.32.0
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
sha256sums_x86_64=('774fc71efc2b41327aeca7bdff335c6387ff3750e0cfd5cc18a64709ba1e412a')
sha256sums_i686=('e91109bc1aaf96fe24d2633dbcb7e9ffd662280a249c71edf8899f52d952ac5f')
sha256sums_aarch64=('1571229e6a74f17e83849d2241f214222e236701258e551def306495364d7490')
sha256sums_armv6h=('b6c0ef8ad1136054768b30073e6c8d4ecbd185fad9608d57ac83f4107b37904d')
sha256sums_armv7h=('1234cca44a54bb19a5cce4ca506348d0bc83ad57d20826c0aebf9aaba0b7fd45')

package() {
  local x86_64=amd64 i686=386 aarch64=arm64 armv6h=armv6 armv7h=armv7
  cd "golangci-lint-${pkgver}-linux-${!CARCH}"
  install -Dm755 golangci-lint -t "$pkgdir"/usr/bin
  ./golangci-lint completion bash | install -Dm644 /dev/stdin "$pkgdir"/usr/share/bash-completion/completions/golangci-lint
  ./golangci-lint completion zsh | install -Dm644 /dev/stdin "$pkgdir"/usr/share/zsh/site-functions/_golangci-lint
}
