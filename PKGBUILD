# Maintainer: Amy Wilson <awils_1 at xsmail dot com>
pkgname="wyvern"
pkgver="1.2.0"
pkgrel="1"
pkgdesc="Command-line tool written in rust that is meant to make downloading GOG games and associated activities easier and faster on linux."
arch=("x86_64")
url="https://git.sr.ht/%7Enicohman/wyvern/"
license=("GPL")
makedepends=("rust")
depends=("curl")
source=("https://git.sr.ht/%7Enicohman/$pkgname/archive/${pkgver}.tar.gz")
sha256sums=('50385a48ce9c6f4fbb06aa3037d56b8cb4458f7eaf6ed9ff05307ddea93c4d8b')

build() {
  cd ${pkgname}-${pkgver}
  cargo build --release
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm 755 "target/release/${pkgname}" -t "$pkgdir/usr/bin"
}
