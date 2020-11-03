# Maintainer: ml <ml@visu.li>
pkgname=golangci-lint-bin
pkgdesc='Linters Runner for Go. 5x faster than gometalinter.'
pkgver=1.32.2
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
sha256sums_x86_64=('e7ab86d833bf9faed39801ab3b5cd294f026d26f9a7da63a42390943ead486cc')
sha256sums_i686=('4895fc307d9fbaab20bb6bbd9e31a08013db6b4372f8f00fd10d172af2b9617e')
sha256sums_aarch64=('800093c347fb2800c7fadb51be81cfcf1f083da8b47882177b3eea80e48bca26')
sha256sums_armv6h=('ece429d0e1b53581421bab06bface3ad19a8977b580107ebce05b52747fbd506')
sha256sums_armv7h=('ffa0d4433e9f4302f89365d4d6fb50200125bd7d91f08554afa2144e1b43d09f')

package() {
  local x86_64=amd64 i686=386 aarch64=arm64 armv6h=armv6 armv7h=armv7
  cd "golangci-lint-${pkgver}-linux-${!CARCH}"
  install -Dm755 golangci-lint -t "$pkgdir"/usr/bin
  ./golangci-lint completion bash | install -Dm644 /dev/stdin "$pkgdir"/usr/share/bash-completion/completions/golangci-lint
  ./golangci-lint completion zsh | install -Dm644 /dev/stdin "$pkgdir"/usr/share/zsh/site-functions/_golangci-lint
}
