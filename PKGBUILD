# Maintainer: ml <ml@visu.li>
pkgname=golangci-lint-bin
pkgdesc='Linters Runner for Go. 5x faster than gometalinter.'
pkgver=1.42.0
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
sha256sums_x86_64=('6937f62f8e2329e94822dc11c10b871ace5557ae1fcc4ee2f9980cd6aecbc159')
sha256sums_i686=('42c78e31faf62b225363eff1b1d2aa74f9dbcb75686c8914aa3e90d6af65cece')
sha256sums_aarch64=('2cf8d23d96cd854a537b355dab2962b960b88a06b615232599f066afd233f246')
sha256sums_armv6h=('08b003d1ed61367473886defc957af5301066e62338e5d96a319c34dadc4c1d1')
sha256sums_armv7h=('c7c00ec4845e806a1f32685f5b150219e180bd6d6a9d584be8d27f0c41d7a1bf')

package() {
  local x86_64=amd64 i686=386 aarch64=arm64 armv6h=armv6 armv7h=armv7
  cd "golangci-lint-${pkgver}-linux-${!CARCH}"
  install -Dm755 golangci-lint -t "$pkgdir"/usr/bin
  ./golangci-lint completion bash | install -Dm644 /dev/stdin "$pkgdir"/usr/share/bash-completion/completions/golangci-lint
  ./golangci-lint completion zsh | install -Dm644 /dev/stdin "$pkgdir"/usr/share/zsh/site-functions/_golangci-lint
}
