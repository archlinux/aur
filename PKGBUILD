pkgname=showiescii
pkgver=1.1.0
pkgrel=2
pkgdesc="Use showie::to_ascii, Crate in shell."
url="https://github.com/IOU-KR/showiescii"
depends=()
optdepends=()
makedepends=('cargo')
arch=('any')
license=('MIT')
source=(${pkgname}-${pkgver}.tar.gz::"${url}/archive/v${pkgver}.tar.gz")

sha256sums=('SKIP')

build() {
  cd "${pkgname}-${pkgver}"

  cargo build --release
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm755 "target/release/showiescii" "${pkgdir}/usr/bin/showiescii"
}
