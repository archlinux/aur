# Contributor: Gleb Buzin <qufiwefefwoyn@gmail.com>
# Contributor: Vlad Frolov <frolvlad@gmail.com>
# Contributor: tee < teeaur at duck dot com >

pkgname=jql
pkgver=8.0.8
pkgrel=1
pkgdesc="A JSON Query Language CLI tool"
url="https://github.com/yamafaktory/jql"
depends=('gcc-libs')
makedepends=('cargo')
arch=('x86_64')
license=('MIT')
source=("$url/archive/jql-v${pkgver}.tar.gz")
sha512sums=('c180083f891872af0a63e5ce8df947ebefba928a6429c083671f52d4e454e20f7edf20dbeb8d80895016b34ccb81d39c0b32b5d75e839fd4ada4cd3b27a6700c')

build() {
  cd "${pkgname}-${pkgname}-v${pkgver}"
  cargo build --release --locked
}

check() {
  cd "${pkgname}-${pkgname}-v${pkgver}"
  cargo test --release --locked
}

package() {
  cd "${pkgname}-${pkgname}-v${pkgver}"
  install -Dm755 "target/release/jql" -t "${pkgdir}/usr/bin"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 LICENSE-MIT -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
