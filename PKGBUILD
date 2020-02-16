# Maintainer: Caleb Bassi <calebjbassi@gmail.com>

# https://wiki.archlinux.org/index.php/Rust_package_guidelines

pkgname=ytop
pkgver=0.5.0
pkgrel=1
pkgdesc="A TUI system monitor written in Rust"
arch=(x86_64)
url="https://github.com/cjbassi/ytop"
license=("MIT")
makedepends=("cargo")
provides=(${pkgname})
conflicts=(${pkgname})
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=("6c1ff6cfaa8072a9d6d984b38d8ebfaa042679dd1d63f2c300f68ad89039a341")

build() {
	cd "${pkgname}-${pkgver}"
	cargo build --release --locked --all-features
}

package() {
	install -Dm755 "${pkgname}-${pkgver}/target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
