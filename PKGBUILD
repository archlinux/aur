# Maintainer: William Batista <bootlegbilly at protonmail dot ch>

pkgname="gotesplit"
pkgver="0.3.0"
pkgrel="1"
pkgdesc="gotesplit splits the testng in Go into a subset and run it"
arch=('x86_64')
url="https://github.com/Songmu/gotesplit"
license=('MIT')
depends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Songmu/gotesplit/archive/refs/tags/v0.3.0.tar.gz")
b2sums=("415888f9b8027d00062d1b506761c94082a5f4c4afceeac2cdce0a28ec7eeb55dcf8ec1a4ffec1fdaf85456ede531078e11af992851f693c40f5a4378e5e2349")
package() {
  cd "${srcdir}/${pkgname}-${pkgver}/cmd/gotesplit/"
  go build -o gotesplit .
  mkdir -p "${pkgdir}/usr/bin/"
  chmod +x ./gotesplit
  mv ./gotesplit "${pkgdir}/usr/bin/"
}
