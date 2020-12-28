# Maintainer: ml <ml@visu.li>
pkgname=golangci-lint-bin
pkgdesc='Linters Runner for Go. 5x faster than gometalinter.'
pkgver=1.34.0
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
sha256sums_x86_64=('84c2ba1ee85a8a75b704a88ae2f34bf389ae48e26b601c6a105d0265fdfbcac6')
sha256sums_i686=('b9ff034ee90eb86209e57ce4d00e96805c633151a9c66f3f8a042ee92ffbb262')
sha256sums_aarch64=('ac1b5a2e1f44a70be97d1861d1cc8157d6f3a1c59c757ce5312787153e300952')
sha256sums_armv6h=('41d96357fcf4b1631663f8e8026dd28e5cc0d0e4919b00835b2d5a48b4d9dbf3')
sha256sums_armv7h=('89b3423ca9b87fed3759654de54b3406eed838d0d4ecafdb28e57da84be90607')

package() {
  local x86_64=amd64 i686=386 aarch64=arm64 armv6h=armv6 armv7h=armv7
  cd "golangci-lint-${pkgver}-linux-${!CARCH}"
  install -Dm755 golangci-lint -t "$pkgdir"/usr/bin
  ./golangci-lint completion bash | install -Dm644 /dev/stdin "$pkgdir"/usr/share/bash-completion/completions/golangci-lint
  ./golangci-lint completion zsh | install -Dm644 /dev/stdin "$pkgdir"/usr/share/zsh/site-functions/_golangci-lint
}
