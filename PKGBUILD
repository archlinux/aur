# Maintainer: Attenuation <ouyangjun1999@gmail.com>
pkgname=tztail
pkgver=1.0.0
pkgrel=1
pkgdesc='tztail (TimeZoneTAIL) allows you to view logs in the timezone you want '
arch=('x86_64')
url='https://github.com/thecasualcoder/tztail'
license=('MIT')
makedepends=('rust')
depends=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('5adebc8cbc19e933ed8088682a75dd1b5a96f0c3d0e6c1976f3875afc04e45ab')

build() {
  cd "$pkgname-$pkgver"

  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/$pkgname "$pkgdir/usr/bin/$pkgname"
}