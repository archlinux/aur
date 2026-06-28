# Maintainer: Mohammed Sajid Shaik <sajid.shaik1186@gmail.com>
pkgname=zengit
pkgver=0.8.6
pkgrel=1
pkgdesc="A minimalistic, simple, yet a feature rich Git TUI."
arch=('x86_64' 'aarch64')
url="https://github.com/rokybeast/zengit"
license=('MIT')
makedepends=('go')
provides=('zengit')
conflicts=('zengit-git')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('1f44116e8d43a7966716b1f94f986cc40d3b7c214f9b6e1407297fdeff4a90a0')

build() {
  cd "${pkgname}-${pkgver}"
  export CGO_ENABLED=0
  go build -o "${pkgname}" -ldflags="-s -w" main.go
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
