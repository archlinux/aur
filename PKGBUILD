# Maintainer: Amy Wilson <awils_1 at xsmail dot com>
pkgname="wyvern"
pkgver="1.0.1"
pkgrel="1"
pkgdesc="Command-line tool written in rust that is meant to make downloading GOG games and associated activities easier and faster on linux."
arch=("x86_64")
url="https://git.sr.ht/%7Enicohman/wyvern/"
license=("GPL")
makedepends=("rust")
depends=("openssl")
source=("https://git.sr.ht/%7Enicohman/$pkgname/archive/${pkgver}.tar.gz")
sha256sums=('e18830237037d2c3d0cf911e8be4e8dbeb2ac4cbe5d954cfca2f57435da0cc61')

build() {
  cd ${pkgname}-${pkgver}
  cargo build --release
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm 755 "target/release/${pkgname}" -t "$pkgdir/usr/bin"
}

