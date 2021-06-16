# Maintainer: ml <ml@visu.li>
pkgname=golangci-lint-bin
pkgdesc='Linters Runner for Go. 5x faster than gometalinter.'
pkgver=1.41.0
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
sha256sums_x86_64=('3235174db16aa1b91d0af520c8e54d65ab037fd54031c9d03adc831fd8bb5beb')
sha256sums_i686=('01016e42a17260ae98458989b769418acfc34638f0887a818a291ca3df1e4ffe')
sha256sums_aarch64=('c0f90a977d255ab85a19503822ecdf67eddce16253e11189b85781893b4c46ca')
sha256sums_armv6h=('e2b502ae3d4a8571d62873f05350a063363ea298b16e1312e73fc296a705fd69')
sha256sums_armv7h=('3e88f92ce1b0375d67ad9b719f5c4e3f73e9d8e8d6f8c85ac0e58d93720e86d9')

package() {
  local x86_64=amd64 i686=386 aarch64=arm64 armv6h=armv6 armv7h=armv7
  cd "golangci-lint-${pkgver}-linux-${!CARCH}"
  install -Dm755 golangci-lint -t "$pkgdir"/usr/bin
  ./golangci-lint completion bash | install -Dm644 /dev/stdin "$pkgdir"/usr/share/bash-completion/completions/golangci-lint
  ./golangci-lint completion zsh | install -Dm644 /dev/stdin "$pkgdir"/usr/share/zsh/site-functions/_golangci-lint
}
