# Maintainer: WiRight <ruslan.mahin1@gmail.com>
# Dizoft Team

pkgname=drpc
pkgver=1.3.0
pkgrel=0
pkgdesc="JsonRPC cli client. Small and faster"
arch=('x86_64')
url="https://github.com/DizoftTeam/dron"
license=('MIT')
makedepends=('go' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/DizoftTeam/$pkgname/archive/$pkgver.tar.gz")
md5sums=('bf8c66a82734d77d917357662f106ea9')

build() {
  cd "$pkgname-$pkgver"
  go build -o drpc ./main.go
}

package() {
  install -Dm755 "$pkgname-$pkgver/$pkgname" "${pkgdir}/usr/local/bin/${pkgname}"
  install -Dm644 "${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
