# Maintainer: Kenneth Endfinger <kaendfinger@gmail.com>

pkgname=cargo-benchcmp
pkgver=0.4.2
pkgrel=1
pkgdesc="A small utility to compare Rust micro-benchmarks"
url="https://github.com/BurntSushi/cargo-benchcmp"
makedepends=('cargo')
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
license=('MIT' 'UNLICENSE')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/BurntSushi/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('4eaff04ac9bd468381a24b86e6fc118a6fff6865c37ddc4b0c8ce86ffad0878c4fe493edd82055165f83e62b1d8bd93e8482da31ab243ad80a7cf0108e86cd05')

build() {
  cd "${pkgname}-${pkgver}"
  cargo build --release
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "target/release/${pkgname}" -t "${pkgdir}/usr/bin"
  install -Dm644 LICENSE-MIT UNLICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ts=2 sw=2 et:
