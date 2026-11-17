# Maintainer: Lexic <lexic@crazygiscool.com>
pkgname=lexic
pkgver=1.1.2
pkgrel=1
pkgdesc="Offline-first dictionary + SM-2 flashcard desktop app for humanities study"
arch=('x86_64' 'aarch64')
url="https://github.com/Crazygiscool/Lexic"
license=('MIT')
depends=('gtk3' 'libxcb' 'libxkbcommon' 'libxkbcommon-x11' 'libwayland' 'libasound' 'libgl')
makedepends=('cargo' 'rust')
source=("https://github.com/Crazygiscool/Lexic/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd "Lexic-${pkgver}"
  cargo build --release --locked
}

package() {
  cd "Lexic-${pkgver}"
  install -Dm755 target/release/lexic-gui "${pkgdir}/usr/bin/lexic"
  install -Dm644 assets/icons/lexic.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/lexic.png"
}
