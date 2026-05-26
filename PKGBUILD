pkgname=clio
pkgver=1.0.0
pkgrel=1
pkgdesc="A lightning-fast, keyboard-driven TUI for taking Markdown notes in the terminal. Powered by Go & Bubble Tea."
arch=('x86_64')
url="https://github.com/psychosomat/Clio"
license=('MIT')
depends=()
makedepends=('go')
source=("https://github.com/psychosomat/Clio/releases/download/v1.0.0/clio-1.0.0-source.tar.gz")
sha256sums=('cbe5f83759231abbcacc0968ce699797bbd6f9934be133efcdbb21d778cb2b1d')

build() {
  cd "${srcdir}/clio-${pkgver}"
  go build -trimpath -ldflags="-s -w -X main.version=${pkgver}" -o clio ./cmd/clio
}

package() {
  cd "${srcdir}/clio-${pkgver}"
  install -Dm755 clio "${pkgdir}/usr/bin/clio"
}
