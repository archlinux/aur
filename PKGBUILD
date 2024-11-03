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
sha512sums=('ee618895d042d11e401f5f385156f513e255cc3ada963f4baabce79f2dc1321f6942a1779b30fce8b12e09c0c259bcb59be9d76d62d2e99f07d087ad020f8ad7')

package() {
  mkdir -p $pkgdir/usr/local/bin
  install -Dm755 ${cleanname}-go "$pkgdir/usr/bin/$cleanname"
}
