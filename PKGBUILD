# Maintainer: William Batista <bootlegbilly at protonmail dot ch>

pkgname="gotesplit"
pkgver="0.3.1"
pkgrel="1"
pkgdesc="gotesplit splits the testng in Go into a subset and run it"
arch=('x86_64')
url="https://github.com/Songmu/gotesplit"
license=('MIT')
depends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Songmu/gotesplit/archive/refs/tags/v$pkgver.tar.gz")
b2sums=("4b845a417d4013fe9ad0c74865a4cfb4a7c22bfddeff2094c041a573d9f4a77b6f09b0b5d03bb931f6f27a2ae7c77a4523a466d427c4b3cccb8001dc3e7c15ed")
package() {
  cd "${srcdir}/${pkgname}-${pkgver}/cmd/gotesplit/"
  go build -o gotesplit .
  mkdir -p "${pkgdir}/usr/bin/"
  chmod +x ./gotesplit
  mv ./gotesplit "${pkgdir}/usr/bin/"
}
