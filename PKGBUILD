# Maintainer: Temuri Takalandze <takalandzet@gmail.com>
pkgname=goclockify
pkgver=1.0.0
pkgrel=1
pkgdesc='A terminal based client for Clockify time tracker'
arch=('x86_64')
url='https://github.com/ABGEO/goclockify'
license=('MIT')
makedepends=('go' 'make')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('9537c12d019b2da697a6af309563a30c0096e9c5b34846e70e2a5592a86a9b38')

pkgver() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    go run main.go --version
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make build-linux-binary
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 build/$pkgname-$pkgver-linux-amd64 "$pkgdir"/usr/bin/$pkgname
}
