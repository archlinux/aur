# Maintainer: ml <ml@visu.li>
pkgname=golangci-lint-bin
pkgdesc='Linters Runner for Go. 5x faster than gometalinter.'
pkgver=1.37.1
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
sha256sums_x86_64=('1929425d7733d136b342395c77f171d459aa89b198933465ec4c854aa34c41a2')
sha256sums_i686=('461cb9b94de17798125000cf7061a6e34449521bcbdcb1aaf19049b9e6105793')
sha256sums_aarch64=('2a1afc9bf3845178fe09f425ae2911aeba5268a08a6e15737c121d513bf8b1e7')
sha256sums_armv6h=('83a443c2d36654feb7e32a448be22a29687a574dbc669d654829d966935d6de2')
sha256sums_armv7h=('8d8cd069e212a61a79acb5e788cfcb4a9371fd51582199ccd15022acda84c2e1')

package() {
  local x86_64=amd64 i686=386 aarch64=arm64 armv6h=armv6 armv7h=armv7
  cd "golangci-lint-${pkgver}-linux-${!CARCH}"
  install -Dm755 golangci-lint -t "$pkgdir"/usr/bin
  ./golangci-lint completion bash | install -Dm644 /dev/stdin "$pkgdir"/usr/share/bash-completion/completions/golangci-lint
  ./golangci-lint completion zsh | install -Dm644 /dev/stdin "$pkgdir"/usr/share/zsh/site-functions/_golangci-lint
}
