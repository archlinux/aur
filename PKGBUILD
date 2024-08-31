# Maintainer: iamawacko <iamawacko@protonmail.com>
# Contributor: Kenneth Endfinger <kaendfinger@gmail.com>

pkgname=cargo-benchcmp
pkgver=0.4.5
pkgrel=1
pkgdesc="A small utility to compare Rust micro-benchmarks"
url="https://github.com/BurntSushi/cargo-benchcmp"
makedepends=('cargo')
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
license=('MIT' 'UNLICENSE')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/BurntSushi/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('63fbaa3f80a560b10675123fb7b44e3f27ba4c13ecbdfe19d27e039fd99f7342041850d075b74a460c426a03905f58965c4613ae8ff6921f8a22dddb6aac9329')

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
