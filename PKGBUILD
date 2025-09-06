pkgname=showiescii
pkgver=1.0.0
pkgrel=1
pkgdesc="Use showie::to_ascii, Crate in shell."
url="https://github.com/IOU-KR/showiescii"
depends=()
optdepends=()
makedepends=('cargo')
arch=('any')
license=('MIT')
source=(${pkgname}-${pkgver}.tar.gz::"${url}/archive/v${pkgver}.tar.gz")

sha256sums=('6ff10aed963901ab2c6f0aed740d21f071a77c95e556601174c08136f7fb4d13')

build() {
  cd "${pkgname}-${pkgver}"

  cargo build --release
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm755 "target/release/showiescii" "${pkgdir}/usr/bin/showiescii"
}
