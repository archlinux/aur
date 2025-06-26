# Contributor: Gleb Buzin <qufiwefefwoyn@gmail.com>
# Contributor: Vlad Frolov <frolvlad@gmail.com>
# Contributor: tee < teeaur at duck dot com >

pkgname=jql
pkgver=8.0.7
pkgrel=1
pkgdesc="A JSON Query Language CLI tool"
url="https://github.com/yamafaktory/jql"
depends=('gcc-libs')
makedepends=('cargo')
arch=('x86_64')
license=('MIT')
source=("$url/archive/jql-v${pkgver}.tar.gz")
sha512sums=('a9b2d7f1eb42f1912832838bdfeeeef1786595caf6622c4b8baac522f59d546d2c55a4c5b87f45a30c7c2e0b59c4f9ef1c1db1b92d9d2799ce4ca6c2ba64cb4f')

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
