# Maintainer: ml <ml@visu.li>
pkgname=golangci-lint-bin
pkgdesc='Linters Runner for Go. 5x faster than gometalinter.'
pkgver=1.38.0
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
sha256sums_x86_64=('97be8342ac9870bee003904bd8de25c0f3169c6b6238a013d6d6862efa5af992')
sha256sums_i686=('2c73cbe7d54f3d6141abe350fe8580cd57d7af3f6e43e0d1289ec717b45ea0b2')
sha256sums_aarch64=('3bc8e2679ccc3989e7a5ed72c3a552137298e3ff3435387c241c32c530dd9614')
sha256sums_armv6h=('0bce6a0441fb9d74d22df906c82c79e3dc173464bd6a7c97d6c66ccf9992a421')
sha256sums_armv7h=('eb845ab06ad5da608ef2cba5e3c6dc13eae179cd792d36db0e0852aff382ac4f')

package() {
  local x86_64=amd64 i686=386 aarch64=arm64 armv6h=armv6 armv7h=armv7
  cd "golangci-lint-${pkgver}-linux-${!CARCH}"
  install -Dm755 golangci-lint -t "$pkgdir"/usr/bin
  ./golangci-lint completion bash | install -Dm644 /dev/stdin "$pkgdir"/usr/share/bash-completion/completions/golangci-lint
  ./golangci-lint completion zsh | install -Dm644 /dev/stdin "$pkgdir"/usr/share/zsh/site-functions/_golangci-lint
}
