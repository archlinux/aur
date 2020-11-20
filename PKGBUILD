# Maintainer: WiRight <ruslan.mahin1@gmail.com>
# Dizoft Team

pkgname=dron
pkgver=1.3.3
pkgrel=0
pkgdesc="Small command line shell executor"
arch=('x86_64')
url="https://github.com/DizoftTeam/dron"
license=('MIT')
makedepends=('go' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/DizoftTeam/$pkgname/archive/$pkgver.tar.gz")
md5sums=('8c8e5cb91a7d47701084edfba0e19131')

build() {
  cd "$pkgname-$pkgver"
  go build -ldflags "-s -w" -o $pkgname main.go
}

package() {
  install -Dm755 "$pkgname-$pkgver/$pkgname" "${pkgdir}/usr/local/bin/${pkgname}"
  install -Dm644 "${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
