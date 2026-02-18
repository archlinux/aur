# Maintainer: Devan Huapaya hi@devan.gg
pkgname=prompter-cli
pkgver=2.0.1
pkgrel=1
pkgdesc="Prompt assembly tool for AI coding agents"
arch=('x86_64' 'aarch64')
url="https://github.com/imdevan/prompter"
license=('MIT')
makedepends=('go')
source=("prompter-cli-${pkgver}.tar.gz::https://github.com/imdevan/prompter/archive/refs/tags/v2.0.1.tar.gz")
sha256sums=('3057f848dfe19c9771aae293818addbd077a7ef38f6ec68692e7cfb98658e9f9')

build() {
  cd "$srcdir/prompter-${pkgver}"
  go build -trimpath -ldflags "-s -w -X main.version=v${pkgver}" -o prompter ./cmd/prompter
}

package() {
  install -Dm755 "$srcdir/prompter-${pkgver}/prompter" "$pkgdir/usr/bin/prompter"
}
