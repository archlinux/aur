# Maintainer: ml <ml@visu.li>
pkgname=golangci-lint-bin
pkgdesc='Linters Runner for Go. 5x faster than gometalinter.'
pkgver=1.41.1
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
sha256sums_x86_64=('23e1078ab00a750afcde7e7eb5aab8e908ef18bee5486eeaa2d52ee57d178580')
sha256sums_i686=('cdaf14de1f1aa154a1f5dcdb9bd0c9007044cbfb0c39a4a2264055d32c6b8aed')
sha256sums_aarch64=('3bb3823d2d647f94d48a1cb90bbf908ba0983eca71a835cb0cc92c94dcb03ad2')
sha256sums_armv6h=('4c8b8828dd4ee309f086b1c2bb7310bb275795e521853fa30f424afa95c017c9')
sha256sums_armv7h=('fc8a505e7455f4c141af4f9a42f9fcb6b6c11a414795845f33295db487bc0647')

package() {
  local x86_64=amd64 i686=386 aarch64=arm64 armv6h=armv6 armv7h=armv7
  cd "golangci-lint-${pkgver}-linux-${!CARCH}"
  install -Dm755 golangci-lint -t "$pkgdir"/usr/bin
  ./golangci-lint completion bash | install -Dm644 /dev/stdin "$pkgdir"/usr/share/bash-completion/completions/golangci-lint
  ./golangci-lint completion zsh | install -Dm644 /dev/stdin "$pkgdir"/usr/share/zsh/site-functions/_golangci-lint
}
