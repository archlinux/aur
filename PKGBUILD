# Maintainer: ml <ml@visu.li>
pkgname=golangci-lint-bin
pkgdesc='Linters Runner for Go. 5x faster than gometalinter.'
pkgver=1.28.3
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
sha256sums_x86_64=('6f6eef6bbb1064d8170d0410d0ea9e4b9132c1c41f4596b915bd87f667982fb1')
sha256sums_i686=('3d00b615f990e152d06e571d725f7407c03a913d967553167241dddd729ce577')
sha256sums_aarch64=('44bf98b677ce4bf1e874411e4f9b773ae4dad4d11d11d7a5ad62f5047b57e43f')
sha256sums_armv6h=('def3193c9c324362900ce3f5a01c4f7b55f1bdfee73809d9c5b038f8ae858b39')
sha256sums_armv7h=('af5fe6065cd716c619e863bb7f30f856ec9d5575c928614987d5abaab9472678')

package() {
  local x86_64=amd64 i686=386 aarch64=arm64 armv6h=armv6 armv7h=armv7
  cd "golangci-lint-${pkgver}-linux-${!CARCH}"
  install -Dm755 golangci-lint -t "$pkgdir"/usr/bin
  ./golangci-lint completion bash | install -Dm644 /dev/stdin "$pkgdir"/usr/share/bash-completion/completions/golangci-lint
  ./golangci-lint completion zsh | install -Dm644 /dev/stdin "$pkgdir"/usr/share/zsh/site-functions/_golangci-lint
}
