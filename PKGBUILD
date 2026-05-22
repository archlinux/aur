pkgname=tur-rs
pkgver=0.9.2
pkgrel=1
pkgdesc="A relentless, high-concurrency download manager built for speed and efficiency."
arch=('x86_64')
url="https://github.com/greykaizen/tur-rs"
license=('GPL3')
depends=('glibc' 'gcc-libs')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/greykaizen/tur-rs/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd "${pkgname}-${pkgver}"
  cargo build --release --locked
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "target/release/tur" "${pkgdir}/usr/bin/tur"
}
