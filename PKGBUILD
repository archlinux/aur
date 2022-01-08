# Maintainer: fubarhouse
pkgname=pygmy-bin
cleanname=pygmy
provides=(pygmy)
pkgver=0.8.0
pkgrel=1
pkgdesc="Amazee.io's local docker development tool"
arch=('x86_64')
url="https://github.com/pygmystack/pygmy"
license=('MIT')
conflicts=(pygmy pygmy-git pygmy-go pygmy-go-bin pygmy-go-git)
makedepends=('tar')
source=("${cleanname}_${pkgver}::${url}/releases/download/v${pkgver}/${cleanname}-go_${pkgver}_linux_amd64.tar.gz")
sha512sums=('d545682bb940a5616bb62af69d3a2bb3bce17afc3da23e1b00b6f3803e6c66d16990a07d4293f41f44ebfb0b0cc508879e63072733fe86fb296a6c37a54e2d94')

package() {
  mkdir -p $pkgdir/usr/local/bin
  install -Dm755 ${cleanname}-go "$pkgdir/usr/bin/$cleanname"
}
