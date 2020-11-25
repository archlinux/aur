# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Moritz Schönherr <moritz.schoenherr@gmail.com>

pkgname=mdbook
pkgver=0.4.4
pkgrel=1
pkgdesc="Create book from markdown files, like Gitbook but implemented in Rust"
url="https://github.com/rust-lang-nursery/mdBook"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
license=(MPL2)
makedepends=(rust cargo)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/rust-lang-nursery/mdBook/archive/v${pkgver}.tar.gz")
sha256sums=('eaf01085bd25e2efa07b561148afa5e3da3386e5f2c35b245961dc485562c154')
# https://github.com/rust-lang-nursery/mdBook/blob/master/CHANGELOG.md
build() {
  cd "${srcdir}/mdBook-${pkgver}"
  cargo build --release
}

check() {
  cd "${srcdir}/mdBook-${pkgver}"
  cargo test
}

package() {
  cd "${srcdir}/mdBook-${pkgver}"
  install -Dm 755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
