# Maintainer: Amy Wilson <awils_1 at xsmail dot com>
pkgname="wyvern"
pkgver="1.3.0"
pkgrel="1"
pkgdesc="Command-line tool written in rust that is meant to make downloading GOG games and associated activities easier and faster on linux."
arch=("x86_64")
url="https://git.sr.ht/%7Enicohman/wyvern/"
license=("GPL")
makedepends=("rust")
depends=("curl")
source=("https://git.sr.ht/%7Enicohman/$pkgname/archive/${pkgver}.tar.gz")
sha256sums=('aa85c75a13fb19cf4a9d36a46f337a864d2228451d9dcadc8f5fa0510ac8071e')

build() {
  cd ${pkgname}-${pkgver}
  cargo build --release
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm 755 "target/release/${pkgname}" -t "$pkgdir/usr/bin"
}
