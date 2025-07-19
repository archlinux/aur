# Maintainer: Yukina <thienphuc3230 at gmail dot com>

pkgname=rbonsai
pkgver=0.1.5
pkgrel=1
pkgdesc="A port of cbonsai to Rust"
arch=("any")
url="https://github.com/roberte777/rbonsai"
license=("GPL-3.0")
makedepends=("git" "cargo")
source=("https://github.com/roberte777/rbonsai/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("SKIP")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo build --release
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
