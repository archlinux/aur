# Maintainer: Caleb Bassi <calebjbassi@gmail.com>

# https://wiki.archlinux.org/index.php/Rust_package_guidelines

pkgname=ytop
pkgver=0.4.3
pkgrel=1
pkgdesc="A TUI system monitor written in Rust"
arch=(x86_64)
url="https://github.com/cjbassi/ytop"
license=("MIT")
makedepends=("cargo")
provides=(${pkgname})
conflicts=(${pkgname})
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=("e46292f637ae5f11cfa2ce6f8a65a097317ae05d96aa34632f416878a921a41c")

build() {
	cd "${pkgname}-${pkgver}"
	cargo build --release --locked --all-features
}

package() {
	install -Dm755 "${pkgname}-${pkgver}/target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
