# Maintainer: CPT-Dawn <dawnsp0456@gmail.com>
pkgname=nexus-nm
pkgver=1.0.1
pkgrel=1
pkgdesc="A beautiful modern TUI WiFi manager for Arch Linux"
arch=('x86_64' 'aarch64')
url="https://github.com/CPT-Dawn/Nexus"
license=('MIT')
depends=('glibc' 'networkmanager' 'dbus')
makedepends=('cargo' 'rust')
source=("nexus-nm-1.0.1.tar.gz::https://github.com/CPT-Dawn/Nexus/archive/refs/tags/v1.0.1.tar.gz")
sha256sums=('2c07b2a8f526672f91267e6b6c89a656289d0431bcef1bf8713e0bc80ecf03c0')

build() {
  cd "Nexus-1.0.1"
  export CARGO_TARGET_DIR="${srcdir}/target"
  cargo build --release --locked
}

package() {
  cd "Nexus-1.0.1"
  install -Dm755 "${srcdir}/target/release/nexus" "${pkgdir}/usr/bin/nexus"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/nexus-nm/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/nexus-nm/README.md"
}
