# Maintainer: Attenuation <ouyangjun1999@gmail.com>
pkgname=tztail
pkgver=1.1.0
pkgrel=1
pkgdesc='tztail (TimeZoneTAIL) allows you to view logs in the timezone you want '
arch=('x86_64')
url='https://github.com/thecasualcoder/tztail'
license=('MIT')
makedepends=('rust')
depends=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('fa03e8f87705ae4b1a74167453ed3a3041548a49b8545d2800757560886b72c6')

build() {
  cd "$pkgname-$pkgver"

  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/$pkgname "$pkgdir/usr/bin/$pkgname"
}
