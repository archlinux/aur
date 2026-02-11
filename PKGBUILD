# Maintainer Tristan Lay <tristanjetlay1<at>gmail<dot>com>

pkgname=muzi
pkgver=1.1.0
pkgrel=1
pkgdesc="Snappy MPD client written in Zig"
arch=("x86_64")
license=("GPLv3")
makedepends=("zig")
url="https://github.com/TristanJet/muzi"
source=("https://github.com/TristanJet/muzi/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("bb5865aa570fd19db7be6b2d412ffbbd9a95697407b6fc8c5616d2443a55c3a5")

build() {
  cd "${pkgname}-${pkgver}"
  zig build -Doptimize=ReleaseFast
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 zig-out/bin/muzi "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
