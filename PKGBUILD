# Maintainer: ml <ml@visu.li>
pkgname=golangci-lint-bin
pkgdesc='Linters Runner for Go. 5x faster than gometalinter.'
pkgver=1.34.1
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
sha256sums_x86_64=('23e4a9d8f89729007c6d749c245f725c2dbcfb194f4099003f9b826f1d386ad1')
sha256sums_i686=('591d10309e5b9f7ad7b45aa8f5125d696cdb57cad3248fb44c5b8307522f7db6')
sha256sums_aarch64=('3bdfb7e619c665878d90cb73d45b35e8af6d753421cb8be07c40b63f3215bb02')
sha256sums_armv6h=('76d885bd9940a8ece6dfd6b4eb6720a782c655ad03c811248216648bb2bb80b4')
sha256sums_armv7h=('8231a12e3246edb9fb14c0ec1e7543342bc53c5cf05e250f0625b9e2efb32564')

package() {
  local x86_64=amd64 i686=386 aarch64=arm64 armv6h=armv6 armv7h=armv7
  cd "golangci-lint-${pkgver}-linux-${!CARCH}"
  install -Dm755 golangci-lint -t "$pkgdir"/usr/bin
  ./golangci-lint completion bash | install -Dm644 /dev/stdin "$pkgdir"/usr/share/bash-completion/completions/golangci-lint
  ./golangci-lint completion zsh | install -Dm644 /dev/stdin "$pkgdir"/usr/share/zsh/site-functions/_golangci-lint
}
