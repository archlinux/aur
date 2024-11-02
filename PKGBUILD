# Maintainer: fubarhouse
pkgname=pygmy-static-bin
cleanname=pygmy
provides=(pygmy)
pkgver=0.13.1
pkgrel=1
pkgdesc="Amazee.io's local docker development tool"
arch=('x86_64')
url="https://github.com/pygmystack/pygmy"
license=('MIT')
conflicts=(pygmy pygmy-bin pygmy-git pygmy-go pygmy-go-bin pygmy-go-git)
makedepends=('tar')
source=("${cleanname}_${pkgver}::${url}/releases/download/v${pkgver}/${cleanname}_${pkgver}_linux_arm64_static.tar.gz")
sha512sums=('c8b63a8cbe59d0dcdd92a028d0fb6fee134af4766fbf1276a97313ba005b1881bd284a42328f1ed53f98611c190c407a02628220adafcdd21064cf9b94a2505a')

package() {
  mkdir -p $pkgdir/usr/local/bin
  install -Dm755 ${cleanname}-go "$pkgdir/usr/bin/$cleanname"
}
