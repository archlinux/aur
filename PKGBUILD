# Maintainer: William Batista <bootlegbilly at protonmail dot ch>

pkgname="gotesplit"
pkgver="0.2.1"
pkgrel="1"
pkgdesc="gotesplit splits the testng in Go into a subset and run it"
arch=('x86_64')
url="https://github.com/Songmu/gotesplit"
license=('MIT')
depends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Songmu/gotesplit/archive/refs/tags/v0.2.1.tar.gz")
b2sums=("5f870b561a2abda5ab42d52d6d8b0473a8c1ee341d54572b8028ab6e41a6ec357a93bb4d1afaba620bd5f7f5f5bf1b68c8227d0a215ff2c024c66353f8cca0d0")
package() {
  cd "${srcdir}/${pkgname}-${pkgver}/cmd/gotesplit/"
  go build -o gotesplit .
  mkdir -p "${pkgdir}/usr/bin/"
  chmod +x ./gotesplit
  mv ./gotesplit "${pkgdir}/usr/bin/"
}
