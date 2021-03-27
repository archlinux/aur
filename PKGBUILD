# Maintainer: ml <ml@visu.li>
pkgname=golangci-lint-bin
pkgdesc='Linters Runner for Go. 5x faster than gometalinter.'
pkgver=1.39.0
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
sha256sums_x86_64=('3a73aa7468087caa62673c8adea99b4e4dff846dc72707222db85f8679b40cbf')
sha256sums_i686=('df25d9267168323b163147acb823ab0215a8a3bb6898a4a9320afdfedde66817')
sha256sums_aarch64=('d1234c213b74751f1af413302dde0e9a6d4d29aecef034af7abb07dc1b6e887f')
sha256sums_armv6h=('a7fa7ab2bfc99cbe5e5bcbf5684f5a997f920afbbe2f253d2feb1001d5e3c8b3')
sha256sums_armv7h=('9687e4ff15545cfc722b0e46107a94195166a505023b48a316579af25ad09505')

package() {
  local x86_64=amd64 i686=386 aarch64=arm64 armv6h=armv6 armv7h=armv7
  cd "golangci-lint-${pkgver}-linux-${!CARCH}"
  install -Dm755 golangci-lint -t "$pkgdir"/usr/bin
  ./golangci-lint completion bash | install -Dm644 /dev/stdin "$pkgdir"/usr/share/bash-completion/completions/golangci-lint
  ./golangci-lint completion zsh | install -Dm644 /dev/stdin "$pkgdir"/usr/share/zsh/site-functions/_golangci-lint
}
