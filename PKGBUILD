# Maintainer: Harrison <htv04rules at gmail dot com>

pkgname=dma330as-git
pkgver=r2.61a8748
pkgrel=1
pkgdesc="Unfinished Corelink DMA-330 assembler"
arch=("x86_64" "i686" "pentium4" "arm" "armv6h" "armv7h" "aarch64")
url="https://github.com/profi200/dma330as"
license=("GPL3")
makedepends=("git")
provides=("dma330as")
conflicts=("dma330as")
source=("git+https://github.com/profi200/dma330as.git")
sha256sums=("SKIP")

pkgver() {
  cd "${srcdir}/dma330as"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  pushd "${srcdir}/dma330as" > /dev/null
  make
  popd > /dev/null
}

package() {
  install -Dm0755 "${srcdir}/dma330as/dma330as" "${pkgdir}/usr/bin/dma330as"
}
