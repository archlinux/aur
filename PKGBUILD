# Maintainer: fubarhouse
pkgname=pygmy-static-bin
cleanname=pygmy
provides=(pygmy)
pkgver=0.8.0
pkgrel=1
pkgdesc="Amazee.io's local docker development tool"
arch=('x86_64')
url="https://github.com/pygmystack/pygmy"
license=('MIT')
conflicts=(pygmy pygmy-bin pygmy-git pygmy-go pygmy-go-bin pygmy-go-git)
makedepends=('tar')
source=("${cleanname}_${pkgver}::${url}/releases/download/v${pkgver}/${cleanname}-go_${pkgver}_linux_amd64_static.tar.gz")
sha512sums=('d82afffdbecc0ebfc2425de3ccba6faa7c571027127f1fc2164428a3b0c29cfe6f5ff856c2eca7c7e541f9040b23543f3df0932301da73dc04d8376d395ed0d5')

package() {
  mkdir -p $pkgdir/usr/local/bin
  install -Dm755 ${cleanname}-go "$pkgdir/usr/bin/$cleanname"
}
