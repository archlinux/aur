# Maintainer: WiRight <ruslan.mahin1@gmail.com>
# Dizoft Team

pkgname=drpc
pkgver=1.2.1
pkgrel=0
pkgdesc="JsonRPC cli client. Small and faster"
arch=('x86_64')
url="https://github.com/DizoftTeam/dron"
license=('MIT')
makedepends=('go' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/DizoftTeam/$pkgname/archive/$pkgver.tar.gz")
md5sums=('2c055eb4a047fa0ecb46458f4e2376b9')

build() {
  cd "$pkgname-$pkgver"
  go build -o drpc ./main.go
}

package() {
  install -Dm755 "$pkgname-$pkgver/$pkgname" "${pkgdir}/usr/local/bin/${pkgname}"
  install -Dm644 "${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
