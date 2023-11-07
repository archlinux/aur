# Maintainer: Your Name <youremail@domain.com>
pkgname=asahi-nvram
pkgver=1
pkgrel=1
pkgdesc="Nvram reader/writer for arm macs."
arch=(aarch64)
url="https://github.com/WhatAmISupposedToPutHere/asahi-nvram"
makedepends=(git rust)
source=(git+https://github.com/WhatAmISupposedToPutHere/asahi-nvram.git)
sha256sums=('SKIP')

build() {
  cd "$pkgname"
  cargo build --release
}

package() {
  cd "$pkgname"
  mkdir -p "${pkgdir}/usr/bin/"
  install -Dm644 target/release/asahi-* "${pkgdir}/usr/bin/"
}
