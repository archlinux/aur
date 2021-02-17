# Maintainer: ml <ml@visu.li>
pkgname=golangci-lint-bin
pkgdesc='Linters Runner for Go. 5x faster than gometalinter.'
pkgver=1.37.0
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
sha256sums_x86_64=('5fe9852e754b621c5264fb8ac810a75033e7f18e972315a60c5c3f8a37b3cb88')
sha256sums_i686=('c1ba7d67dc69fe09513a9ec15b87e718a18baa3d56f0eaa3aaecd7ad6997a6fe')
sha256sums_aarch64=('0472b1d0349e2a9872282b2f08e29daef8d92c43823b5f88758f0ce7c9f64be7')
sha256sums_armv6h=('8e912c240fb96f1eb08e4c2108f97762e16a9ccb06f3c9dcad3efe16b54676e1')
sha256sums_armv7h=('0f9ad8b5b204d4e4da4ac41c8ff902aae6a396629a4b758d057fe5a16a157cf6')

package() {
  local x86_64=amd64 i686=386 aarch64=arm64 armv6h=armv6 armv7h=armv7
  cd "golangci-lint-${pkgver}-linux-${!CARCH}"
  install -Dm755 golangci-lint -t "$pkgdir"/usr/bin
  ./golangci-lint completion bash | install -Dm644 /dev/stdin "$pkgdir"/usr/share/bash-completion/completions/golangci-lint
  ./golangci-lint completion zsh | install -Dm644 /dev/stdin "$pkgdir"/usr/share/zsh/site-functions/_golangci-lint
}
