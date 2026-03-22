# Maintainer: CPT-Dawn <dawnsp0456@gmail.com>
pkgname=voidlink
_reponame=VoidLink
pkgver=0.1.0
pkgrel=1
pkgdesc="A blazing-fast, memory-safe Bluetooth TUI manager for Linux"
arch=('x86_64' 'aarch64')
url="https://github.com/CPT-Dawn/VoidLink"
license=('MIT')
depends=('gcc-libs' 'glibc' 'bluez' 'dbus')
makedepends=('cargo')
provides=("voidlink")
source=("https://github.com/CPT-Dawn/VoidLink/archive/refs/tags/v0.1.0.tar.gz")
sha256sums=('SKIP') 

build() {
  cd "${_reponame}-${pkgver}"
  export CARGO_TARGET_DIR="target"
  cargo build --release --locked
}

package() {
  cd "${_reponame}-${pkgver}"
  install -Dm755 "target/release/voidlink" "${pkgdir}/usr/bin/voidlink"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
