# Maintainer: Amy Wilson <awils_1 at xsmail dot com>
pkgname="wyvern"
pkgver="1.4.0"
pkgrel="1"
pkgdesc="Command-line tool written in rust that is meant to make downloading GOG games and associated activities easier and faster on linux."
arch=("x86_64")
url="https://git.sr.ht/%7Enicohman/wyvern/"
license=("GPL")
makedepends=("rust")
depends=("curl")
source=("https://git.sr.ht/%7Enicohman/$pkgname/archive/${pkgver}.tar.gz")
sha256sums=('9478574848b07e8fc93e5c67673e19f79602042a9924deaea7e05002e83ab7b4')

build() {
  cd ${pkgname}-${pkgver}
  cargo build --release
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm 755 "target/release/${pkgname}" -t "$pkgdir/usr/bin"
}
