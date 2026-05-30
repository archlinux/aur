pkgname=clio
pkgver=1.0.1
pkgrel=1
pkgdesc="A lightning-fast, keyboard-driven TUI for taking Markdown notes in the terminal. Powered by Go & Bubble Tea."
arch=('x86_64')
url="https://github.com/psychosomat/Clio"
license=('MIT')
depends=()
makedepends=('go')
source=("https://github.com/psychosomat/Clio/releases/download/v1.0.1/clio-1.0.1-source.tar.gz")
sha256sums=('9575b2f7993d423d098b90aebef3799461d05930b922dddacc2ef4859be89471')

build() {
  cd "${srcdir}/clio-${pkgver}"
  go build -trimpath -ldflags="-s -w -X main.version=${pkgver}" -o clio ./cmd/clio
}

package() {
  cd "${srcdir}/clio-${pkgver}"
  install -Dm755 clio "${pkgdir}/usr/bin/clio"
}
