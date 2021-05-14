# Maintainer: ml <ml@visu.li>
pkgname=golangci-lint-bin
pkgdesc='Linters Runner for Go. 5x faster than gometalinter.'
pkgver=1.40.1
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
sha256sums_x86_64=('7c133b4b39c0a46cf8d67265da651f169079d137ae71aee9b5934e2281bd18d3')
sha256sums_i686=('9ca21b42b01cf7515079baa9841e0584b8f2dcebe5b00d420c0c0e45703a0c37')
sha256sums_aarch64=('e11b167548e465a79d38b2da5e3f9ed3891f5489a796d802928165829b1aeeb2')
sha256sums_armv6h=('cde1f69aacc7e76e1bee9b9b442777e71013ea60fd0fca30c3c9c2987f7297a9')
sha256sums_armv7h=('72b8954f863a51668fed6b8f0000f691b46ba0e71d24b9ab6834c820e82126c5')

package() {
  local x86_64=amd64 i686=386 aarch64=arm64 armv6h=armv6 armv7h=armv7
  cd "golangci-lint-${pkgver}-linux-${!CARCH}"
  install -Dm755 golangci-lint -t "$pkgdir"/usr/bin
  ./golangci-lint completion bash | install -Dm644 /dev/stdin "$pkgdir"/usr/share/bash-completion/completions/golangci-lint
  ./golangci-lint completion zsh | install -Dm644 /dev/stdin "$pkgdir"/usr/share/zsh/site-functions/_golangci-lint
}
