# Maintainer: kpcyrd <git@rxv.cc>

pkgname=cargo-benchcmp
pkgver=0.4.1
pkgrel=1
pkgdesc="A small utility to compare Rust micro-benchmarks"
url="https://github.com/BurntSushi/cargo-benchcmp"
makedepends=('cargo')
arch=('i686' 'x86_64' 'armv6h')
license=('MIT' 'UNLICENSE')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/BurntSushi/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('ea0b3f7f2f8721f45da0afcb87238274e46226a0f19f08e1f1ce4c263e9a8968489fd2fb778e97a346622b1a96b9b9e79717f807d09bf65176c091df4e21b52f')

build() {
  cd "${pkgname}-${pkgver}"
  # upstream doesn't have a Cargo.lock
  #cargo build --release --locked
  cargo build --release
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "target/release/${pkgname}" -t "${pkgdir}/usr/bin"
  install -Dm644 LICENSE-MIT UNLICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ts=2 sw=2 et:
