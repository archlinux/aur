# Maintainer: ml <ml@visu.li>
pkgname=golangci-lint-bin
pkgdesc='Linters Runner for Go. 5x faster than gometalinter.'
pkgver=1.27.0
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
sha256sums_x86_64=('8d345e4e88520e21c113d81978e89ad77fc5b13bfdf20e5bca86b83fc4261272')
sha256sums_i686=('5f37e2b33914ecddb7cad38186ef4ec61d88172fc04f930fa0267c91151ff306')
sha256sums_aarch64=('90205fc42ab5ed0096413e790d88ac9b4ed60f4c47e576d13dc0660f7ed4b013')
sha256sums_armv6h=('38e1e3dadbe3f56ab62b4de82ee0b88e8fad966d8dfd740a26ef94c2edef9818')
sha256sums_armv7h=('d998a84eea42f2271aca792a7b027ca5c1edfcba229e8e5a844c9ac3f336df35')

package() {
  local x86_64=amd64 i686=386 aarch64=arm64 armv6h=armv6 armv7h=armv7
  cd "golangci-lint-${pkgver}-linux-${!CARCH}"
  install -Dm755 golangci-lint -t "$pkgdir"/usr/bin
  ./golangci-lint completion bash | install -Dm644 /dev/stdin "$pkgdir"/usr/share/bash-completion/completions/golangci-lint
  ./golangci-lint completion zsh | install -Dm644 /dev/stdin "$pkgdir"/usr/share/zsh/site-functions/_golangci-lint
}
