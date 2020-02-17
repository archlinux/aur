# Maintainer: Caleb Bassi <calebjbassi@gmail.com>

# https://wiki.archlinux.org/index.php/Rust_package_guidelines

pkgname=ytop
pkgver=0.5.1
pkgrel=1
pkgdesc="A TUI system monitor written in Rust"
arch=(x86_64)
url="https://github.com/cjbassi/ytop"
license=("MIT")
makedepends=("cargo")
provides=(${pkgname})
conflicts=(${pkgname})
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=("5eb8bc9fd210ac782ff51be98e387c9c63d69dfe97fa69f3fa11c58cf7c9d2df")

build() {
	cd "${pkgname}-${pkgver}"
	cargo build --release --locked --all-features
}

package() {
	install -Dm755 "${pkgname}-${pkgver}/target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
