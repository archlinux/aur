# Maintainer: BarbUk <julien.virey@gmail.com>

pkgname=rackpeek-bin
pkgver=0.0.3
pkgrel=1
pkgdesc='CLI tool to discover, manage, and document your IT infrastructure and home lab.'
arch=(x86_64 aarch64)
url='https://github.com/Timmoth/RackPeek'
license=('AGPL-3.0-or-later')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
depends=(glibc libgcc libstdc++)
options=(!strip)
source=($pkgname.install)
source_x86_64=("$pkgname-$pkgver-x86_64::$url/releases/download/RackPeek-${pkgver}/${pkgname%-bin}_${pkgver//./_}_linux-x64")
source_aarch64=("$pkgname-$pkgver-aarch64::$url/releases/download/RackPeek-${pkgver}/${pkgname%-bin}_${pkgver//./_}_linux-arm64")
sha256sums=('a8b0762ddaa8b90f0ae195f778b61fcf1293dcc969c34f86894719952ed27b01')
sha256sums_x86_64=('47ead3be812be06f73c030a42063293c5f552466d36f15f8bbcc705e5af89536')
sha256sums_aarch64=('7dca9e770298b5be7b093fd6e68a0c8bb8830296dfdfc03a9c553420215eac60')
install=$pkgname.install

package() {
  install -Dm755 "$pkgname-$pkgver-$CARCH" "${pkgdir}/usr/bin/${pkgname%-bin}"
}
