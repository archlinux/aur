# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
# Contributor: Moritz Schönherr <moritz.schoenherr@gmail.com>

pkgname=mdbook
pkgver=0.2.2
pkgrel=1
pkgdesc="Create book from markdown files, like Gitbook but implemented in Rust"
url="https://github.com/rust-lang-nursery/mdBook"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
license=(MPL2)
makedepends=(rust cargo)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/rust-lang-nursery/mdBook/archive/v${pkgver}.tar.gz")
sha256sums=('e196da4856d7205cf485412657b92d9df83364376a5a74574e3440bb047c57f6')

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
