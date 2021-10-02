# Maintainer: Pedro Tashima <pedrotashima42@gmail.com>
# Contributor: Matt Boulanger <mattboulanger@fastmail.com>

pkgname=hash-id
pkgver=0.1.0
pkgrel=1
arch=("i686" "x86_64" "armv6h" "armv7h")
pkgdesc="Hash Identifying tool"
url="https://github.com/tashima42/hash-id"
makedepends=("cargo" "git")
license=("GPL3")
source=("${pkgname}::git+https://github.com/tashima42/${pkgname}.git#tag=v${pkgver}")
sha512sums=("SKIP")

build() {
    cd "${srcdir}/${pkgname}/"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --locked
}

package() {
    cd "${srcdir}/${pkgname}/"
    install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
