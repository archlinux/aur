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
sha256sums=('423e7368d751e0d6f7fdd6aee9199c5318694f424ffd86fd7fe036ec0917eaeb')

build() {
  cd "${pkgname}-${pkgver}"
  export CGO_ENABLED=0
  go build -o "${pkgname}" -ldflags="-s -w" main.go
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
