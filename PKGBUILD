# Maintainer: ml <ml@visu.li>
pkgname=golangci-lint-bin
pkgdesc='Linters Runner for Go. 5x faster than gometalinter.'
pkgver=1.30.0
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
sha256sums_x86_64=('c8e8fc5753e74d2eb489ad428dbce219eb9907799a57c02bcd8b80b4b98c60d4')
sha256sums_i686=('74fbcf4110ec10b0ddcc1779cfbe11a83ce1b7b83920d8eefa195cc93e3c11f3')
sha256sums_aarch64=('a9c1d14d84a687fb8e67c2c613533ec3e2802b5baf95ca82ad528f788cb6d61f')
sha256sums_armv6h=('669ef3611963b44dc5b6cbf3709b5dd56c9d1dab11562309a5cdefcf4096eed0')
sha256sums_armv7h=('d15ed16baa62d89ccdf3a6189219a1f4e8820721d9a1e2e361fb92c2525f324e')

package() {
  local x86_64=amd64 i686=386 aarch64=arm64 armv6h=armv6 armv7h=armv7
  cd "golangci-lint-${pkgver}-linux-${!CARCH}"
  install -Dm755 golangci-lint -t "$pkgdir"/usr/bin
  ./golangci-lint completion bash | install -Dm644 /dev/stdin "$pkgdir"/usr/share/bash-completion/completions/golangci-lint
  ./golangci-lint completion zsh | install -Dm644 /dev/stdin "$pkgdir"/usr/share/zsh/site-functions/_golangci-lint
}
