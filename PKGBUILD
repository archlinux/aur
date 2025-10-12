# Contributor: Gleb Buzin <qufiwefefwoyn@gmail.com>
# Contributor: Vlad Frolov <frolvlad@gmail.com>
# Contributor: tee < teeaur at duck dot com >

pkgname=jql
pkgver=8.0.9
pkgrel=1
pkgdesc="A JSON Query Language CLI tool"
url="https://github.com/yamafaktory/jql"
depends=('gcc-libs')
makedepends=('cargo')
arch=('x86_64')
license=('MIT')
source=("$url/archive/jql-v${pkgver}.tar.gz")
sha512sums=('09d6a1bda077af6e2b434595b0e53122d0f885ec8b9241ea7631efff5c55368ef39a6a3c335d14f83c515a7e0ddc4fe0d3156571528a1890a855cfc05c6793ee')

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
