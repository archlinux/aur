# Maintainer: Amy Wilson <awils_1 at xsmail dot com>
pkgname="wyvern"
pkgver="1.1.0"
pkgrel="1"
pkgdesc="Command-line tool written in rust that is meant to make downloading GOG games and associated activities easier and faster on linux."
arch=("x86_64")
url="https://git.sr.ht/%7Enicohman/wyvern/"
license=("GPL")
makedepends=("rust")
depends=("curl")
source=("https://git.sr.ht/%7Enicohman/$pkgname/archive/${pkgver}.tar.gz")
sha256sums=('82819f5099785da4af27bd48aba1943dfed3fd90e07f3a068c77779f01867c55')

build() {
  cd ${pkgname}-${pkgver}
  cargo build --release
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm 755 "target/release/${pkgname}" -t "$pkgdir/usr/bin"
}
sha256sums=('82819f5099785da4af27bd48aba1943dfed3fd90e07f3a068c77779f01867c55')
