# Maintainer: Omyac <packages@omy.ac>

pkgname=warpdir
pkgver=0.1.3
pkgrel=1
pkgdesc="shortcuts/bookmarks to directories"
url="https://xr0.org/src/wd-rs"
arch=("i686" "x86_64" "aarch64")
license=("MIT")
makedepends=("rust")

source=(
  "${pkgname}-${pkgver}.tar.gz::https://xr0.org/src/wd-rs/uv/${pkgname}-${pkgver}-src.tar.gz"
)

sha256sums=(
  13cd50b664df0c5956e5cb336f129bd021a4df7a5d8153ce67b7e2dbb55f20ba
)

build() {
  cd "${pkgname}-${pkgver}"
  cargo build --release
  cd target/release
  
}

package() {
  cd "${pkgname}-${pkgver}/target/release"
  install -Dm755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
}
